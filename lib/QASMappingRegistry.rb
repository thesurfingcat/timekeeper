require 'QAS.rb'
require 'soap/mapping'

module QASMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsWeb200709 = "http://www.qas.com/web-2007-09"

  EncodedRegistry.register(
    :class => QASearchType,
    :schema_type => XSD::QName.new(NsWeb200709, "QASearchType"),
    :schema_element => [
      ["search", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "Search")], [0, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Count") => "SOAP::SOAPString"
    }
  )

  EncodedRegistry.register(
    :class => EngineType,
    :schema_type => XSD::QName.new(NsWeb200709, "EngineType"),
    :schema_attribute => {
      XSD::QName.new(nil, "Flatten") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Intensity") => "SOAP::SOAPString",
      XSD::QName.new(nil, "PromptSet") => "SOAP::SOAPString",
      XSD::QName.new(nil, "Threshold") => "SOAP::SOAPPositiveInteger",
      XSD::QName.new(nil, "Timeout") => "SOAP::SOAPNonNegativeInteger"
    }
  )

  EncodedRegistry.register(
    :class => QABulkSearchItemType,
    :schema_type => XSD::QName.new(NsWeb200709, "QABulkSearchItemType"),
    :schema_element => [
      ["qAAddress", ["QAAddressType", XSD::QName.new(NsWeb200709, "QAAddress")]],
      ["inputAddress", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "InputAddress")]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "VerifyLevel") => "SOAP::SOAPString"
    }
  )

  EncodedRegistry.register(
    :class => QAPicklistType,
    :schema_type => XSD::QName.new(NsWeb200709, "QAPicklistType"),
    :schema_element => [
      ["fullPicklistMoniker", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "FullPicklistMoniker")]],
      ["picklistEntry", ["PicklistEntryType[]", XSD::QName.new(NsWeb200709, "PicklistEntry")], [0, nil]],
      ["prompt", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Prompt")]],
      ["total", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "Total")]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "AutoFormatSafe") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AutoFormatPastClose") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AutoStepinSafe") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AutoStepinPastClose") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "LargePotential") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "MaxMatches") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "MoreOtherMatches") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "OverThreshold") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Timeout") => "SOAP::SOAPBoolean"
    }
  )

  EncodedRegistry.register(
    :class => PicklistEntryType,
    :schema_type => XSD::QName.new(NsWeb200709, "PicklistEntryType"),
    :schema_element => [
      ["moniker", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Moniker")]],
      ["partialAddress", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "PartialAddress")]],
      ["picklist", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Picklist")]],
      ["postcode", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Postcode")]],
      ["score", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "Score")]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "FullAddress") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Multiples") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "CanStep") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AliasMatch") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "PostcodeRecoded") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "CrossBorderMatch") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "DummyPOBox") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Name") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Information") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "WarnInformation") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "IncompleteAddr") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "UnresolvableRange") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "PhantomPrimaryPoint") => "SOAP::SOAPBoolean"
    }
  )

  EncodedRegistry.register(
    :class => QAAddressType,
    :schema_type => XSD::QName.new(NsWeb200709, "QAAddressType"),
    :schema_element => [
      ["addressLine", ["AddressLineType[]", XSD::QName.new(NsWeb200709, "AddressLine")], [1, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Overflow") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Truncated") => "SOAP::SOAPBoolean"
    }
  )

  EncodedRegistry.register(
    :class => AddressLineType,
    :schema_type => XSD::QName.new(NsWeb200709, "AddressLineType"),
    :schema_element => [
      ["label", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Label")], [0, 1]],
      ["line", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Line")], [0, 1]],
      ["dataplusGroup", ["DataplusGroupType[]", XSD::QName.new(NsWeb200709, "DataplusGroup")], [0, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "LineContent") => "SOAP::SOAPString",
      XSD::QName.new(nil, "Overflow") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Truncated") => "SOAP::SOAPBoolean"
    }
  )

  EncodedRegistry.register(
    :class => DataplusGroupType,
    :schema_type => XSD::QName.new(NsWeb200709, "DataplusGroupType"),
    :schema_element => [
      ["dataplusGroupItem", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "DataplusGroupItem")], [1, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "GroupName") => "SOAP::SOAPString"
    }
  )

  EncodedRegistry.register(
    :class => QADataSet,
    :schema_type => XSD::QName.new(NsWeb200709, "QADataSet"),
    :schema_element => [
      ["iD", [nil, XSD::QName.new(NsWeb200709, "ID")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Name")]]
    ]
  )

  EncodedRegistry.register(
    :class => QALicensedSet,
    :schema_type => XSD::QName.new(NsWeb200709, "QALicensedSet"),
    :schema_element => [
      ["iD", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ID")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Description")]],
      ["copyright", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Copyright")]],
      ["version", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Version")]],
      ["baseCountry", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "BaseCountry")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Status")]],
      ["server", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Server")]],
      ["warningLevel", ["LicenceWarningLevel", XSD::QName.new(NsWeb200709, "WarningLevel")]],
      ["daysLeft", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "DaysLeft")]],
      ["dataDaysLeft", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "DataDaysLeft")]],
      ["licenceDaysLeft", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "LicenceDaysLeft")]]
    ]
  )

  EncodedRegistry.register(
    :class => QAExampleAddress,
    :schema_type => XSD::QName.new(NsWeb200709, "QAExampleAddress"),
    :schema_element => [
      ["address", ["QAAddressType", XSD::QName.new(NsWeb200709, "Address")]],
      ["comment", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Comment")]]
    ]
  )

  EncodedRegistry.register(
    :class => QALayout,
    :schema_type => XSD::QName.new(NsWeb200709, "QALayout"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Name")]],
      ["comment", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Comment")]]
    ]
  )

  EncodedRegistry.register(
    :class => PromptLine,
    :schema_type => XSD::QName.new(NsWeb200709, "PromptLine"),
    :schema_element => [
      ["prompt", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Prompt")]],
      ["suggestedInputLength", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "SuggestedInputLength")]],
      ["example", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Example")]]
    ]
  )

  EncodedRegistry.register(
    :class => QAConfigType,
    :schema_type => XSD::QName.new(NsWeb200709, "QAConfigType"),
    :schema_element => [
      ["iniFile", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "IniFile")], [0, 1]],
      ["iniSection", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "IniSection")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => EngineEnumType,
    :schema_type => XSD::QName.new(NsWeb200709, "EngineEnumType")
  )

  EncodedRegistry.register(
    :class => EngineIntensityType,
    :schema_type => XSD::QName.new(NsWeb200709, "EngineIntensityType")
  )

  EncodedRegistry.register(
    :class => PromptSetType,
    :schema_type => XSD::QName.new(NsWeb200709, "PromptSetType")
  )

  EncodedRegistry.register(
    :class => VerifyLevelType,
    :schema_type => XSD::QName.new(NsWeb200709, "VerifyLevelType")
  )

  EncodedRegistry.register(
    :class => LineContentType,
    :schema_type => XSD::QName.new(NsWeb200709, "LineContentType")
  )

  EncodedRegistry.register(
    :class => LicenceWarningLevel,
    :schema_type => XSD::QName.new(NsWeb200709, "LicenceWarningLevel")
  )

  LiteralRegistry.register(
    :class => QASearchType,
    :schema_type => XSD::QName.new(NsWeb200709, "QASearchType"),
    :schema_element => [
      ["search", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "Search")], [0, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Count") => "SOAP::SOAPString"
    }
  )

  LiteralRegistry.register(
    :class => EngineType,
    :schema_type => XSD::QName.new(NsWeb200709, "EngineType"),
    :schema_attribute => {
      XSD::QName.new(nil, "Flatten") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Intensity") => "SOAP::SOAPString",
      XSD::QName.new(nil, "PromptSet") => "SOAP::SOAPString",
      XSD::QName.new(nil, "Threshold") => "SOAP::SOAPPositiveInteger",
      XSD::QName.new(nil, "Timeout") => "SOAP::SOAPNonNegativeInteger"
    }
  )

  LiteralRegistry.register(
    :class => QABulkSearchItemType,
    :schema_type => XSD::QName.new(NsWeb200709, "QABulkSearchItemType"),
    :schema_element => [
      ["qAAddress", ["QAAddressType", XSD::QName.new(NsWeb200709, "QAAddress")]],
      ["inputAddress", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "InputAddress")]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "VerifyLevel") => "SOAP::SOAPString"
    }
  )

  LiteralRegistry.register(
    :class => QAPicklistType,
    :schema_type => XSD::QName.new(NsWeb200709, "QAPicklistType"),
    :schema_element => [
      ["fullPicklistMoniker", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "FullPicklistMoniker")]],
      ["picklistEntry", ["PicklistEntryType[]", XSD::QName.new(NsWeb200709, "PicklistEntry")], [0, nil]],
      ["prompt", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Prompt")]],
      ["total", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "Total")]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "AutoFormatSafe") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AutoFormatPastClose") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AutoStepinSafe") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AutoStepinPastClose") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "LargePotential") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "MaxMatches") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "MoreOtherMatches") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "OverThreshold") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Timeout") => "SOAP::SOAPBoolean"
    }
  )

  LiteralRegistry.register(
    :class => PicklistEntryType,
    :schema_type => XSD::QName.new(NsWeb200709, "PicklistEntryType"),
    :schema_element => [
      ["moniker", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Moniker")]],
      ["partialAddress", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "PartialAddress")]],
      ["picklist", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Picklist")]],
      ["postcode", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Postcode")]],
      ["score", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "Score")]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "FullAddress") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Multiples") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "CanStep") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "AliasMatch") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "PostcodeRecoded") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "CrossBorderMatch") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "DummyPOBox") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Name") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Information") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "WarnInformation") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "IncompleteAddr") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "UnresolvableRange") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "PhantomPrimaryPoint") => "SOAP::SOAPBoolean"
    }
  )

  LiteralRegistry.register(
    :class => QAAddressType,
    :schema_type => XSD::QName.new(NsWeb200709, "QAAddressType"),
    :schema_element => [
      ["addressLine", ["AddressLineType[]", XSD::QName.new(NsWeb200709, "AddressLine")], [1, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Overflow") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Truncated") => "SOAP::SOAPBoolean"
    }
  )

  LiteralRegistry.register(
    :class => AddressLineType,
    :schema_type => XSD::QName.new(NsWeb200709, "AddressLineType"),
    :schema_element => [
      ["label", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Label")], [0, 1]],
      ["line", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Line")], [0, 1]],
      ["dataplusGroup", ["DataplusGroupType[]", XSD::QName.new(NsWeb200709, "DataplusGroup")], [0, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "LineContent") => "SOAP::SOAPString",
      XSD::QName.new(nil, "Overflow") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "Truncated") => "SOAP::SOAPBoolean"
    }
  )

  LiteralRegistry.register(
    :class => DataplusGroupType,
    :schema_type => XSD::QName.new(NsWeb200709, "DataplusGroupType"),
    :schema_element => [
      ["dataplusGroupItem", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "DataplusGroupItem")], [1, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "GroupName") => "SOAP::SOAPString"
    }
  )

  LiteralRegistry.register(
    :class => QADataSet,
    :schema_type => XSD::QName.new(NsWeb200709, "QADataSet"),
    :schema_element => [
      ["iD", [nil, XSD::QName.new(NsWeb200709, "ID")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Name")]]
    ]
  )

  LiteralRegistry.register(
    :class => QALicensedSet,
    :schema_type => XSD::QName.new(NsWeb200709, "QALicensedSet"),
    :schema_element => [
      ["iD", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ID")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Description")]],
      ["copyright", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Copyright")]],
      ["version", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Version")]],
      ["baseCountry", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "BaseCountry")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Status")]],
      ["server", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Server")]],
      ["warningLevel", ["LicenceWarningLevel", XSD::QName.new(NsWeb200709, "WarningLevel")]],
      ["daysLeft", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "DaysLeft")]],
      ["dataDaysLeft", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "DataDaysLeft")]],
      ["licenceDaysLeft", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "LicenceDaysLeft")]]
    ]
  )

  LiteralRegistry.register(
    :class => QAExampleAddress,
    :schema_type => XSD::QName.new(NsWeb200709, "QAExampleAddress"),
    :schema_element => [
      ["address", ["QAAddressType", XSD::QName.new(NsWeb200709, "Address")]],
      ["comment", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Comment")]]
    ]
  )

  LiteralRegistry.register(
    :class => QALayout,
    :schema_type => XSD::QName.new(NsWeb200709, "QALayout"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Name")]],
      ["comment", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Comment")]]
    ]
  )

  LiteralRegistry.register(
    :class => PromptLine,
    :schema_type => XSD::QName.new(NsWeb200709, "PromptLine"),
    :schema_element => [
      ["prompt", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Prompt")]],
      ["suggestedInputLength", ["SOAP::SOAPNonNegativeInteger", XSD::QName.new(NsWeb200709, "SuggestedInputLength")]],
      ["example", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Example")]]
    ]
  )

  LiteralRegistry.register(
    :class => QAConfigType,
    :schema_type => XSD::QName.new(NsWeb200709, "QAConfigType"),
    :schema_element => [
      ["iniFile", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "IniFile")], [0, 1]],
      ["iniSection", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "IniSection")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => EngineEnumType,
    :schema_type => XSD::QName.new(NsWeb200709, "EngineEnumType")
  )

  LiteralRegistry.register(
    :class => EngineIntensityType,
    :schema_type => XSD::QName.new(NsWeb200709, "EngineIntensityType")
  )

  LiteralRegistry.register(
    :class => PromptSetType,
    :schema_type => XSD::QName.new(NsWeb200709, "PromptSetType")
  )

  LiteralRegistry.register(
    :class => VerifyLevelType,
    :schema_type => XSD::QName.new(NsWeb200709, "VerifyLevelType")
  )

  LiteralRegistry.register(
    :class => LineContentType,
    :schema_type => XSD::QName.new(NsWeb200709, "LineContentType")
  )

  LiteralRegistry.register(
    :class => LicenceWarningLevel,
    :schema_type => XSD::QName.new(NsWeb200709, "LicenceWarningLevel")
  )

  LiteralRegistry.register(
    :class => QASearch,
    :schema_name => XSD::QName.new(NsWeb200709, "QASearch"),
    :schema_element => [
      ["country", [nil, XSD::QName.new(NsWeb200709, "Country")]],
      ["engine", ["EngineType", XSD::QName.new(NsWeb200709, "Engine")]],
      ["layout", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Layout")], [0, 1]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]],
      ["search", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Search")]]
    ]
  )

  LiteralRegistry.register(
    :class => QABulkSearch,
    :schema_name => XSD::QName.new(NsWeb200709, "QABulkSearch"),
    :schema_element => [
      ["country", [nil, XSD::QName.new(NsWeb200709, "Country")]],
      ["engine", ["EngineType", XSD::QName.new(NsWeb200709, "Engine")]],
      ["layout", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Layout")], [0, 1]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]],
      ["bulkSearchTerm", ["QASearchType", XSD::QName.new(NsWeb200709, "BulkSearchTerm")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => QASearchResult,
    :schema_name => XSD::QName.new(NsWeb200709, "QASearchResult"),
    :schema_element => [
      ["qAPicklist", ["QAPicklistType", XSD::QName.new(NsWeb200709, "QAPicklist")], [0, 1]],
      ["qAAddress", ["QAAddressType", XSD::QName.new(NsWeb200709, "QAAddress")], [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "VerifyLevel") => "SOAP::SOAPString"
    }
  )

  LiteralRegistry.register(
    :class => QABulkSearchResult,
    :schema_name => XSD::QName.new(NsWeb200709, "QABulkSearchResult"),
    :schema_element => [
      ["bulkAddress", ["QABulkSearchItemType[]", XSD::QName.new(NsWeb200709, "BulkAddress")], [1, nil]],
      ["bulkError", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "BulkError")], [0, 1]],
      ["errorCode", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ErrorCode")], [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Count") => "SOAP::SOAPString",
      XSD::QName.new(nil, "SearchCount") => "SOAP::SOAPString"
    }
  )

  LiteralRegistry.register(
    :class => QARefine,
    :schema_name => XSD::QName.new(NsWeb200709, "QARefine"),
    :schema_element => [
      ["moniker", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Moniker")]],
      ["refinement", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Refinement")]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Threshold") => "SOAP::SOAPPositiveInteger",
      XSD::QName.new(nil, "Timeout") => "SOAP::SOAPNonNegativeInteger"
    }
  )

  LiteralRegistry.register(
    :class => Picklist,
    :schema_name => XSD::QName.new(NsWeb200709, "Picklist"),
    :schema_element => [
      ["qAPicklist", ["QAPicklistType", XSD::QName.new(NsWeb200709, "QAPicklist")]]
    ]
  )

  LiteralRegistry.register(
    :class => QAGetAddress,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetAddress"),
    :schema_element => [
      ["layout", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Layout")]],
      ["moniker", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Moniker")]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => Address,
    :schema_name => XSD::QName.new(NsWeb200709, "Address"),
    :schema_element => [
      ["qAAddress", ["QAAddressType", XSD::QName.new(NsWeb200709, "QAAddress")]]
    ]
  )

  LiteralRegistry.register(
    :class => QAData,
    :schema_name => XSD::QName.new(NsWeb200709, "QAData"),
    :schema_element => [
      ["dataSet", ["QADataSet[]", XSD::QName.new(NsWeb200709, "DataSet")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QAGetData,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetData"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => QAGetLicenseInfo,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetLicenseInfo"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => QAGetSystemInfo,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetSystemInfo"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => QAGetDataMapDetail,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetDataMapDetail"),
    :schema_element => [
      ["dataMap", [nil, XSD::QName.new(NsWeb200709, "DataMap")]]
    ]
  )

  LiteralRegistry.register(
    :class => QADataMapDetail,
    :schema_name => XSD::QName.new(NsWeb200709, "QADataMapDetail"),
    :schema_element => [
      ["warningLevel", ["LicenceWarningLevel", XSD::QName.new(NsWeb200709, "WarningLevel")]],
      ["licensedSet", ["QALicensedSet[]", XSD::QName.new(NsWeb200709, "LicensedSet")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QALicenceInfo,
    :schema_name => XSD::QName.new(NsWeb200709, "QALicenceInfo"),
    :schema_element => [
      ["warningLevel", ["LicenceWarningLevel", XSD::QName.new(NsWeb200709, "WarningLevel")]],
      ["licensedSet", ["QALicensedSet[]", XSD::QName.new(NsWeb200709, "LicensedSet")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QASystemInfo,
    :schema_name => XSD::QName.new(NsWeb200709, "QASystemInfo"),
    :schema_element => [
      ["systemInfo", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "SystemInfo")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QAGetExampleAddresses,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetExampleAddresses"),
    :schema_element => [
      ["country", [nil, XSD::QName.new(NsWeb200709, "Country")]],
      ["layout", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Layout")]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => QAExampleAddresses,
    :schema_name => XSD::QName.new(NsWeb200709, "QAExampleAddresses"),
    :schema_element => [
      ["exampleAddress", ["QAExampleAddress[]", XSD::QName.new(NsWeb200709, "ExampleAddress")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QAGetLayouts,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetLayouts"),
    :schema_element => [
      ["country", [nil, XSD::QName.new(NsWeb200709, "Country")]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => QALayouts,
    :schema_name => XSD::QName.new(NsWeb200709, "QALayouts"),
    :schema_element => [
      ["layout", ["QALayout[]", XSD::QName.new(NsWeb200709, "Layout")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QAGetPromptSet,
    :schema_name => XSD::QName.new(NsWeb200709, "QAGetPromptSet"),
    :schema_element => [
      ["country", [nil, XSD::QName.new(NsWeb200709, "Country")]],
      ["engine", ["EngineType", XSD::QName.new(NsWeb200709, "Engine")], [0, 1]],
      ["promptSet", ["PromptSetType", XSD::QName.new(NsWeb200709, "PromptSet")]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => QAPromptSet,
    :schema_name => XSD::QName.new(NsWeb200709, "QAPromptSet"),
    :schema_element => [
      ["line", ["PromptLine[]", XSD::QName.new(NsWeb200709, "Line")], [0, nil]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "Dynamic") => "SOAP::SOAPBoolean"
    }
  )

  LiteralRegistry.register(
    :class => QACanSearch,
    :schema_name => XSD::QName.new(NsWeb200709, "QACanSearch"),
    :schema_element => [
      ["country", [nil, XSD::QName.new(NsWeb200709, "Country")]],
      ["engine", ["EngineType", XSD::QName.new(NsWeb200709, "Engine")]],
      ["layout", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "Layout")], [0, 1]],
      ["qAConfig", ["QAConfigType", XSD::QName.new(NsWeb200709, "QAConfig")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => QASearchOk,
    :schema_name => XSD::QName.new(NsWeb200709, "QASearchOk"),
    :schema_element => [
      ["isOk", ["SOAP::SOAPBoolean", XSD::QName.new(NsWeb200709, "IsOk")]],
      ["errorCode", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ErrorCode")], [0, 1]],
      ["errorMessage", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ErrorMessage")], [0, 1]],
      ["errorDetail", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "ErrorDetail")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => QAFault,
    :schema_name => XSD::QName.new(NsWeb200709, "QAFault"),
    :schema_element => [
      ["errorCode", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ErrorCode")]],
      ["errorMessage", ["SOAP::SOAPString", XSD::QName.new(NsWeb200709, "ErrorMessage")]],
      ["errorDetail", ["SOAP::SOAPString[]", XSD::QName.new(NsWeb200709, "ErrorDetail")], [0, nil]]
    ]
  )
end
