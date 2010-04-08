class UpdateUcasChoices < Struct.new(:choice_id)
  
  def perform
    
    begin
      @appchoice = Ucaschoice.find_by_id(choice_id)
      @setting = Ucasxmllinksetting.find(:first)
      require 'soap/wsdlDriver'
      wsdl = @setting.wsdl
      institutionCode = @setting.institutioncode
      userId = @setting.userid
      password = @setting.password
      lastUpdated = ''
      rowStartPosition = '0'
      driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver
      XSD::Charset.encoding = 'UTF8'
      result = driver.getUCASApplicantChoices(institutionCode, userId, password, '', @appchoice.personalId, @appchoice.applicationSchemeCode, '',rowStartPosition)

      if result.uCASResponse.status == "SUCCESS"
        if result.uCASApplicantsChoices !=nil and result.uCASApplicantsChoices.size > 0

          attribs = ["applicationNumber" , "applicationSchemeCode", "campus" , "choiceNumber" , "conditions" , "courseCode", "courseTitle" , "decision" ,"decisionCount" , "deferEntry" , "faculty" , "furtherDetails" , "homeLivingFlag" , "institutionCode" , "institutionDecisionDate" ,"institutionName" ,"jointType" , "lastChanged" , "lastUpdated", "monthEntry", "personalId", "pointOfEntry" , "preference" , "previousCampus" , "previousCourse" , "previousInstitution", "referralDate", "reply" , "roundNumber" , "routeBDate" , "shortCourseName" , "shortInstitutionName" , "startDate", "substitutedDate" , "summaryConditions" , "yearOfEntry" ]
          result.uCASApplicantsChoices.each_with_index do |rec,i|
           hsh={}
           attribs.each {|meth| hsh[meth.to_sym] = result.uCASApplicantsChoices[i].send(meth.to_sym)}
           if hsh[:lastUpdated] != nil
             hsh[:lastUpdated] = hsh[:lastUpdated].to_time.utc
           end
           if hsh[:lastChanged] != nil
             hsh[:lastChanged] = hsh[:lastChanged].to_time.utc
           end
           @choice = Ucaschoice.find(:first, :conditions=>{:personalId => result.uCASApplicantsChoices[i].personalId, :applicationSchemeCode => result.uCASApplicantsChoices[i].applicationSchemeCode, :choiceNumber => result.uCASApplicantsChoices[i].choiceNumber })
            if @choice != nil
              if @choice.lastUpdated != hsh[:lastUpdated]
                @choice.update_attributes(hsh)  
              end
            else
              Ucaschoice.create(hsh)
            end
          end
        end
        Delayed::Job.enqueue(UpdateUcasApp.new(@appchoice.personalId, @appchoice.applicationSchemeCode, @appchoice.id))
      else
        @appchoice.update_attributes(:process_flag => 'Completed', :process_message => 'Problem updating Choice', :process_outcome => 'Fail' )
      end  
    end
    rescue Exception => exc
      @appchoice.update_attributes(:process_flag => 'Completed', :process_message => exc.message + '(Getting Choices)', :process_outcome => 'Fail' )
  end

end