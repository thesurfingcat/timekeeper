class UpdateUcasApp < Struct.new(:personal_id, :app_scheme_code, :choice_id)
  
  def perform
    
    begin
      @app = Ucasapp.find(:first, :conditions => { :personalId => personal_id, :applicationSchemeCode => app_scheme_code })
      @choice = Ucaschoice.find_by_id(choice_id)
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
      result = driver.getUCASApplicantsDetails(institutionCode, userId, password, '', @app.personalId, @app.applicationSchemeCode, '',rowStartPosition)    

      if result.uCASResponse.status == "SUCCESS"
        if result.uCASApplicantsDetails !=nil and result.uCASApplicantsDetails.size > 0

          attribs = ["address1" , "address2" , "address3" , "address4" , "addressArea" , "advancedInternationalCertOfEduc" , "age" , "applicantIsVisible" , "applicantStatusNumber" , "applicationNumber" , "applicationSchemeCode" , "applicationSource" , "areaPermanentResidence" , "areaPermanentResidenceCode" ,"btec" , "btecRegNumber" , "careCode" , "clearingNumber" , "country" , "countryCode" , "countryOfBirth" , "countryOfBirthCode" , "criminalConvictions" , "dateApplied" , "dateEnteredUK" , "dateOfBirth" , "disabilityCode" , "disabilityIDCode" , "dualNationality" , "dualNationalityCode" , "emailAddress" , "emailOk" , "ethnic" , "ethnicCode" , "feeCode" , "feePayerCode" , "firstname" , "gce" , "gender" ,"homeAddress1" , "homeAddress2" , "homeAddress3" , "homeAddress4" , "homeCountry" , "homeCountryCode" , "homePhoneNo" , "homePostcode" , "institutionCode" , "internationalBaccalaureate" , "irishLeavingCertificate" , "isTakingKeySkills" , "isTakingVocationalExams" , "language" , "lastEducationEstablishment" , "lastChangeDate" , "lastUpdated" , "lateApplicationFlag" , "mailSortCode" , "manualInvesigationOfPrevResultsReqd" , "mobilePhoneNo" , "nationalIdOne" , "nationalIdOneCode" , "nationalIdTwo" , "nationalIdTwoCode" , "nationalInsuranceNumber" , "nationality" , "nationalityCode" , "noMailing" ,"numberPreviousSummerALevels" , "numberPreviousSummerASLevels" , "numberWinterALevels" , "otherExamQuals" , "parentalHECode" , "parentOccupation" , "parentOccupationCode" , "personalId" , "postcode" , "previousApplicationNumber" , "previousOtherExamQuals" , "previousSurname" , "progressFile" , "receivedTopaz" , "residentialCategoryCode" , "residentialCategoryIDCode" , "routeB" , "school" , "schoolCode" , "scottishCandidateNumber" , "smsOk" , "specialNeeds" , "sqa" , "status" , "studentSupportArrangements" , "surname" , "title" ]
          result.uCASApplicantsDetails.each_with_index do |rec,i|
            hsh={}
            attribs.each {|meth| hsh[meth.to_sym] = result.uCASApplicantsDetails[i].send(meth.to_sym)}
            if hsh[:lastUpdated] != nil
              hsh[:lastUpdated] = hsh[:lastUpdated].to_time.utc
            end
            if hsh[:lastChangeDate] != nil
              hsh[:lastChangeDate] = hsh[:lastChangeDate].to_time.utc
            end
            @person = Ucasapp.find(:first, :conditions=>{:personalId => result.uCASApplicantsDetails[i].personalId, :applicationSchemeCode => result.uCASApplicantsDetails[i].applicationSchemeCode })
            if @person != nil
              if @person.lastUpdated != hsh[:lastUpdated]
                @person.update_attributes(hsh)
              end
              @choice.update_attributes(:process_flag => 'Completed', :process_message => 'Choice Updated Successfully.', :process_outcome => 'Success' )
            end
          end
        end
      else
        @choice.update_attributes(:process_flag => 'Completed', :process_message => 'Problem updating Applicant', :process_outcome => 'Fail' )   
      end
    end
    rescue Exception => exc
      @choice.update_attributes(:process_flag => 'Completed', :process_message => exc.message + '(Getting Applicant)', :process_outcome => 'Fail' )
  end

end