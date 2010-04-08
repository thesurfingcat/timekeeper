class SendUcasFirstdecision < Struct.new(:personalId, :applicationSchemeCode, :choiceNumber, :courseCode, :campus, :pointOfEntry, :entryYear, :entryMonth, :decisionCode, :offerText, :choice_id, :currentUser)
  
  def perform

    begin
      @choice = Ucaschoice.find_by_id(choice_id)
      @choice.update_attributes(:process_flag => 'Processing...', :process_message => 'Sending to UCAS please wait...')
      
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

      result = driver.setFirstDecisionTransactionUcas(institutionCode, userId, password, '', personalId, applicationSchemeCode, choiceNumber, courseCode, campus, pointOfEntry, entryYear, entryMonth, decisionCode, offerText)
    
      if result.uCASResponse.status == "SUCCESS"
        if offerText != nil
          @choice.update_attributes(:offertext => offerText)
        end
        Ucasdecisionlog.create(:decisionDate => DateTime.now, :webmethod => 'setFirstDecisionTransactionUcas', :outcome => 'Success', :userId => currentUser, :decisionCode => decisionCode, :offerText => offerText, :personalId => personalId, :applicationSchemeCode => applicationSchemeCode, :choiceNumber => choiceNumber, :courseCode => courseCode, :campus => campus, :pointOfEntry => pointOfEntry, :yearOfEntry => entryYear, :monthEntry => entryMonth)
        Delayed::Job.enqueue(UpdateUcasChoices.new(@choice.id))
        # @choice.update_attributes(:process_flag => 'Completed', :process_message => 'UCAS Updated Successfully.', :process_outcome => 'Success' )
      else
        @choice.update_attributes(:process_flag => 'Completed', :process_message => result.uCASResponse.errorMessage, :process_outcome => 'Fail' )
        Ucasdecisionlog.create(:decisionDate => DateTime.now, :webmethod => 'setFirstDecisionTransactionUcas', :outcome => 'Fail', :message => result.uCASResponse.errorMessage, :userId => currentUser, :decisionCode => decisionCode, :offerText => offerText, :personalId => personalId, :applicationSchemeCode => applicationSchemeCode, :choiceNumber => choiceNumber, :courseCode => courseCode, :campus => campus, :pointOfEntry => pointOfEntry, :yearOfEntry => entryYear, :monthEntry => entryMonth)
      end
    rescue Exception => exc
      @choice.update_attributes(:process_flag => 'Completed', :process_message => exc.message, :process_outcome => 'Fail' )
      Ucasdecisionlog.create(:decisionDate => DateTime.now, :webmethod => 'setFirstDecisionTransactionUcas', :outcome => 'Fail', :message => exc.message, :userId => currentUser, :decisionCode => decisionCode, :offerText => offerText, :personalId => personalId, :applicationSchemeCode => applicationSchemeCode, :choiceNumber => choiceNumber, :courseCode => courseCode, :campus => campus, :pointOfEntry => pointOfEntry, :yearOfEntry => entryYear, :monthEntry => entryMonth)
    end
    
  end
end