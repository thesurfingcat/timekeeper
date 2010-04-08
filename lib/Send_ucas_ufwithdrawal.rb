class SendUcasUfwithdrawal < Struct.new(:personalId, :applicationSchemeCode, :choiceNumber, :choice_id, :currentUser)
  
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

      result = driver.setUFWithdrawalTransactionUcas(institutionCode, userId, password, '', personalId, applicationSchemeCode, choiceNumber)
      if result.uCASResponse.status == "SUCCESS"
        Ucasdecisionlog.create(:decisionDate => DateTime.now, :webmethod => 'setUFWithdrawalTransactionUcas', :outcome => 'Success', :userId => currentUser, :personalId => personalId, :applicationSchemeCode => applicationSchemeCode, :choiceNumber => choiceNumber)
        Delayed::Job.enqueue(UpdateUcasChoices.new(@choice.id))
      else
        @choice.update_attributes(:process_flag => 'Completed', :process_message => result.uCASResponse.errorMessage, :process_outcome => 'Fail' )
        Ucasdecisionlog.create(:decisionDate => DateTime.now, :webmethod => 'setUFWithdrawalTransactionUcas', :outcome => 'Fail', :message => result.uCASResponse.errorMessage, :userId => currentUser, :personalId => personalId, :applicationSchemeCode => applicationSchemeCode, :choiceNumber => choiceNumber)
      end
    rescue Exception => exc
      @choice.update_attributes(:process_flag => 'Completed', :process_message => exc.message, :process_outcome => 'Fail' )
      Ucasdecisionlog.create(:decisionDate => DateTime.now, :webmethod => 'setUFWithdrawalTransactionUcas', :outcome => 'Fail', :message => exc.message, :userId => currentUser, :personalId => personalId, :applicationSchemeCode => applicationSchemeCode, :choiceNumber => choiceNumber)
    end
    
  end
end