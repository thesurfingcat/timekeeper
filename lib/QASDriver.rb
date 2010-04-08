require 'rubygems'  
require 'QAS.rb'
require 'QASMappingRegistry.rb'
require 'soap/rpc/driver'

class QAPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://Qas.isd.glam.ac.uk:2021/"

  Methods = [
    [ "http://www.qas.com/web-2005-02/DoSearch",
      "doSearch",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QASearch"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QASearchResult"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoRefine",
      "doRefine",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QARefine"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "Picklist"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetAddress",
      "doGetAddress",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAGetAddress"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "Address"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetData",
      "doGetData",
      [ ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAData"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetLicenseInfo",
      "doGetLicenseInfo",
      [ ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QALicenceInfo"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetSystemInfo",
      "doGetSystemInfo",
      [ ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QASystemInfo"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetExampleAddresses",
      "doGetExampleAddresses",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAGetExampleAddresses"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAExampleAddresses"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetLayouts",
      "doGetLayouts",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAGetLayouts"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QALayouts"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoGetPromptSet",
      "doGetPromptSet",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAGetPromptSet"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QAPromptSet"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ],
    [ "http://www.qas.com/web-2005-02/DoCanSearch",
      "doCanSearch",
      [ ["in", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QACanSearch"]],
        ["out", "body", ["::SOAP::SOAPElement", "http://www.qas.com/web-2005-02", "QASearchOk"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"Fault"=>{:encodingstyle=>"document", :use=>"literal", :name=>"fault", :ns=>"http://www.qas.com/web-2005-02", :namespace=>nil}} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = QASMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = QASMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end
