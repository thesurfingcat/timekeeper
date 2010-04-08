require 'xsd/qname'

# {http://www.qas.com/web-2007-09}QASearchType
#   search - SOAP::SOAPString
#   xmlattr_Count - SOAP::SOAPString
class QASearchType
  AttrCount = XSD::QName.new(nil, "Count")

  attr_accessor :search

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Count
    __xmlattr[AttrCount]
  end

  def xmlattr_Count=(value)
    __xmlattr[AttrCount] = value
  end

  def initialize(search = [])
    @search = search
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}EngineType
#   xmlattr_Flatten - SOAP::SOAPBoolean
#   xmlattr_Intensity - SOAP::SOAPString
#   xmlattr_PromptSet - SOAP::SOAPString
#   xmlattr_Threshold - SOAP::SOAPPositiveInteger
#   xmlattr_Timeout - SOAP::SOAPNonNegativeInteger
class EngineType < ::String
  AttrFlatten = XSD::QName.new(nil, "Flatten")
  AttrIntensity = XSD::QName.new(nil, "Intensity")
  AttrPromptSet = XSD::QName.new(nil, "PromptSet")
  AttrThreshold = XSD::QName.new(nil, "Threshold")
  AttrTimeout = XSD::QName.new(nil, "Timeout")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Flatten
    __xmlattr[AttrFlatten]
  end

  def xmlattr_Flatten=(value)
    __xmlattr[AttrFlatten] = value
  end

  def xmlattr_Intensity
    __xmlattr[AttrIntensity]
  end

  def xmlattr_Intensity=(value)
    __xmlattr[AttrIntensity] = value
  end

  def xmlattr_PromptSet
    __xmlattr[AttrPromptSet]
  end

  def xmlattr_PromptSet=(value)
    __xmlattr[AttrPromptSet] = value
  end

  def xmlattr_Threshold
    __xmlattr[AttrThreshold]
  end

  def xmlattr_Threshold=(value)
    __xmlattr[AttrThreshold] = value
  end

  def xmlattr_Timeout
    __xmlattr[AttrTimeout]
  end

  def xmlattr_Timeout=(value)
    __xmlattr[AttrTimeout] = value
  end

  def initialize(*arg)
    super
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QABulkSearchItemType
#   qAAddress - QAAddressType
#   inputAddress - SOAP::SOAPString
#   xmlattr_VerifyLevel - SOAP::SOAPString
class QABulkSearchItemType
  AttrVerifyLevel = XSD::QName.new(nil, "VerifyLevel")

  attr_accessor :qAAddress
  attr_accessor :inputAddress

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VerifyLevel
    __xmlattr[AttrVerifyLevel]
  end

  def xmlattr_VerifyLevel=(value)
    __xmlattr[AttrVerifyLevel] = value
  end

  def initialize(qAAddress = nil, inputAddress = nil)
    @qAAddress = qAAddress
    @inputAddress = inputAddress
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QAPicklistType
#   fullPicklistMoniker - SOAP::SOAPString
#   picklistEntry - PicklistEntryType
#   prompt - SOAP::SOAPString
#   total - SOAP::SOAPNonNegativeInteger
#   xmlattr_AutoFormatSafe - SOAP::SOAPBoolean
#   xmlattr_AutoFormatPastClose - SOAP::SOAPBoolean
#   xmlattr_AutoStepinSafe - SOAP::SOAPBoolean
#   xmlattr_AutoStepinPastClose - SOAP::SOAPBoolean
#   xmlattr_LargePotential - SOAP::SOAPBoolean
#   xmlattr_MaxMatches - SOAP::SOAPBoolean
#   xmlattr_MoreOtherMatches - SOAP::SOAPBoolean
#   xmlattr_OverThreshold - SOAP::SOAPBoolean
#   xmlattr_Timeout - SOAP::SOAPBoolean
class QAPicklistType
  AttrAutoFormatPastClose = XSD::QName.new(nil, "AutoFormatPastClose")
  AttrAutoFormatSafe = XSD::QName.new(nil, "AutoFormatSafe")
  AttrAutoStepinPastClose = XSD::QName.new(nil, "AutoStepinPastClose")
  AttrAutoStepinSafe = XSD::QName.new(nil, "AutoStepinSafe")
  AttrLargePotential = XSD::QName.new(nil, "LargePotential")
  AttrMaxMatches = XSD::QName.new(nil, "MaxMatches")
  AttrMoreOtherMatches = XSD::QName.new(nil, "MoreOtherMatches")
  AttrOverThreshold = XSD::QName.new(nil, "OverThreshold")
  AttrTimeout = XSD::QName.new(nil, "Timeout")

  attr_accessor :fullPicklistMoniker
  attr_accessor :picklistEntry
  attr_accessor :prompt
  attr_accessor :total

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_AutoFormatSafe
    __xmlattr[AttrAutoFormatSafe]
  end

  def xmlattr_AutoFormatSafe=(value)
    __xmlattr[AttrAutoFormatSafe] = value
  end

  def xmlattr_AutoFormatPastClose
    __xmlattr[AttrAutoFormatPastClose]
  end

  def xmlattr_AutoFormatPastClose=(value)
    __xmlattr[AttrAutoFormatPastClose] = value
  end

  def xmlattr_AutoStepinSafe
    __xmlattr[AttrAutoStepinSafe]
  end

  def xmlattr_AutoStepinSafe=(value)
    __xmlattr[AttrAutoStepinSafe] = value
  end

  def xmlattr_AutoStepinPastClose
    __xmlattr[AttrAutoStepinPastClose]
  end

  def xmlattr_AutoStepinPastClose=(value)
    __xmlattr[AttrAutoStepinPastClose] = value
  end

  def xmlattr_LargePotential
    __xmlattr[AttrLargePotential]
  end

  def xmlattr_LargePotential=(value)
    __xmlattr[AttrLargePotential] = value
  end

  def xmlattr_MaxMatches
    __xmlattr[AttrMaxMatches]
  end

  def xmlattr_MaxMatches=(value)
    __xmlattr[AttrMaxMatches] = value
  end

  def xmlattr_MoreOtherMatches
    __xmlattr[AttrMoreOtherMatches]
  end

  def xmlattr_MoreOtherMatches=(value)
    __xmlattr[AttrMoreOtherMatches] = value
  end

  def xmlattr_OverThreshold
    __xmlattr[AttrOverThreshold]
  end

  def xmlattr_OverThreshold=(value)
    __xmlattr[AttrOverThreshold] = value
  end

  def xmlattr_Timeout
    __xmlattr[AttrTimeout]
  end

  def xmlattr_Timeout=(value)
    __xmlattr[AttrTimeout] = value
  end

  def initialize(fullPicklistMoniker = nil, picklistEntry = [], prompt = nil, total = nil)
    @fullPicklistMoniker = fullPicklistMoniker
    @picklistEntry = picklistEntry
    @prompt = prompt
    @total = total
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}PicklistEntryType
#   moniker - SOAP::SOAPString
#   partialAddress - SOAP::SOAPString
#   picklist - SOAP::SOAPString
#   postcode - SOAP::SOAPString
#   score - SOAP::SOAPNonNegativeInteger
#   xmlattr_FullAddress - SOAP::SOAPBoolean
#   xmlattr_Multiples - SOAP::SOAPBoolean
#   xmlattr_CanStep - SOAP::SOAPBoolean
#   xmlattr_AliasMatch - SOAP::SOAPBoolean
#   xmlattr_PostcodeRecoded - SOAP::SOAPBoolean
#   xmlattr_CrossBorderMatch - SOAP::SOAPBoolean
#   xmlattr_DummyPOBox - SOAP::SOAPBoolean
#   xmlattr_Name - SOAP::SOAPBoolean
#   xmlattr_Information - SOAP::SOAPBoolean
#   xmlattr_WarnInformation - SOAP::SOAPBoolean
#   xmlattr_IncompleteAddr - SOAP::SOAPBoolean
#   xmlattr_UnresolvableRange - SOAP::SOAPBoolean
#   xmlattr_PhantomPrimaryPoint - SOAP::SOAPBoolean
class PicklistEntryType
  AttrAliasMatch = XSD::QName.new(nil, "AliasMatch")
  AttrCanStep = XSD::QName.new(nil, "CanStep")
  AttrCrossBorderMatch = XSD::QName.new(nil, "CrossBorderMatch")
  AttrDummyPOBox = XSD::QName.new(nil, "DummyPOBox")
  AttrFullAddress = XSD::QName.new(nil, "FullAddress")
  AttrIncompleteAddr = XSD::QName.new(nil, "IncompleteAddr")
  AttrInformation = XSD::QName.new(nil, "Information")
  AttrMultiples = XSD::QName.new(nil, "Multiples")
  AttrName = XSD::QName.new(nil, "Name")
  AttrPhantomPrimaryPoint = XSD::QName.new(nil, "PhantomPrimaryPoint")
  AttrPostcodeRecoded = XSD::QName.new(nil, "PostcodeRecoded")
  AttrUnresolvableRange = XSD::QName.new(nil, "UnresolvableRange")
  AttrWarnInformation = XSD::QName.new(nil, "WarnInformation")

  attr_accessor :moniker
  attr_accessor :partialAddress
  attr_accessor :picklist
  attr_accessor :postcode
  attr_accessor :score

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_FullAddress
    __xmlattr[AttrFullAddress]
  end

  def xmlattr_FullAddress=(value)
    __xmlattr[AttrFullAddress] = value
  end

  def xmlattr_Multiples
    __xmlattr[AttrMultiples]
  end

  def xmlattr_Multiples=(value)
    __xmlattr[AttrMultiples] = value
  end

  def xmlattr_CanStep
    __xmlattr[AttrCanStep]
  end

  def xmlattr_CanStep=(value)
    __xmlattr[AttrCanStep] = value
  end

  def xmlattr_AliasMatch
    __xmlattr[AttrAliasMatch]
  end

  def xmlattr_AliasMatch=(value)
    __xmlattr[AttrAliasMatch] = value
  end

  def xmlattr_PostcodeRecoded
    __xmlattr[AttrPostcodeRecoded]
  end

  def xmlattr_PostcodeRecoded=(value)
    __xmlattr[AttrPostcodeRecoded] = value
  end

  def xmlattr_CrossBorderMatch
    __xmlattr[AttrCrossBorderMatch]
  end

  def xmlattr_CrossBorderMatch=(value)
    __xmlattr[AttrCrossBorderMatch] = value
  end

  def xmlattr_DummyPOBox
    __xmlattr[AttrDummyPOBox]
  end

  def xmlattr_DummyPOBox=(value)
    __xmlattr[AttrDummyPOBox] = value
  end

  def xmlattr_Name
    __xmlattr[AttrName]
  end

  def xmlattr_Name=(value)
    __xmlattr[AttrName] = value
  end

  def xmlattr_Information
    __xmlattr[AttrInformation]
  end

  def xmlattr_Information=(value)
    __xmlattr[AttrInformation] = value
  end

  def xmlattr_WarnInformation
    __xmlattr[AttrWarnInformation]
  end

  def xmlattr_WarnInformation=(value)
    __xmlattr[AttrWarnInformation] = value
  end

  def xmlattr_IncompleteAddr
    __xmlattr[AttrIncompleteAddr]
  end

  def xmlattr_IncompleteAddr=(value)
    __xmlattr[AttrIncompleteAddr] = value
  end

  def xmlattr_UnresolvableRange
    __xmlattr[AttrUnresolvableRange]
  end

  def xmlattr_UnresolvableRange=(value)
    __xmlattr[AttrUnresolvableRange] = value
  end

  def xmlattr_PhantomPrimaryPoint
    __xmlattr[AttrPhantomPrimaryPoint]
  end

  def xmlattr_PhantomPrimaryPoint=(value)
    __xmlattr[AttrPhantomPrimaryPoint] = value
  end

  def initialize(moniker = nil, partialAddress = nil, picklist = nil, postcode = nil, score = nil)
    @moniker = moniker
    @partialAddress = partialAddress
    @picklist = picklist
    @postcode = postcode
    @score = score
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QAAddressType
#   addressLine - AddressLineType
#   xmlattr_Overflow - SOAP::SOAPBoolean
#   xmlattr_Truncated - SOAP::SOAPBoolean
class QAAddressType
  AttrOverflow = XSD::QName.new(nil, "Overflow")
  AttrTruncated = XSD::QName.new(nil, "Truncated")

  attr_accessor :addressLine

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Overflow
    __xmlattr[AttrOverflow]
  end

  def xmlattr_Overflow=(value)
    __xmlattr[AttrOverflow] = value
  end

  def xmlattr_Truncated
    __xmlattr[AttrTruncated]
  end

  def xmlattr_Truncated=(value)
    __xmlattr[AttrTruncated] = value
  end

  def initialize(addressLine = [])
    @addressLine = addressLine
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}AddressLineType
#   label - SOAP::SOAPString
#   line - SOAP::SOAPString
#   dataplusGroup - DataplusGroupType
#   xmlattr_LineContent - SOAP::SOAPString
#   xmlattr_Overflow - SOAP::SOAPBoolean
#   xmlattr_Truncated - SOAP::SOAPBoolean
class AddressLineType
  AttrLineContent = XSD::QName.new(nil, "LineContent")
  AttrOverflow = XSD::QName.new(nil, "Overflow")
  AttrTruncated = XSD::QName.new(nil, "Truncated")

  attr_accessor :label
  attr_accessor :line
  attr_accessor :dataplusGroup

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_LineContent
    __xmlattr[AttrLineContent]
  end

  def xmlattr_LineContent=(value)
    __xmlattr[AttrLineContent] = value
  end

  def xmlattr_Overflow
    __xmlattr[AttrOverflow]
  end

  def xmlattr_Overflow=(value)
    __xmlattr[AttrOverflow] = value
  end

  def xmlattr_Truncated
    __xmlattr[AttrTruncated]
  end

  def xmlattr_Truncated=(value)
    __xmlattr[AttrTruncated] = value
  end

  def initialize(label = nil, line = nil, dataplusGroup = [])
    @label = label
    @line = line
    @dataplusGroup = dataplusGroup
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}DataplusGroupType
#   dataplusGroupItem - SOAP::SOAPString
#   xmlattr_GroupName - SOAP::SOAPString
class DataplusGroupType
  AttrGroupName = XSD::QName.new(nil, "GroupName")

  attr_accessor :dataplusGroupItem

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_GroupName
    __xmlattr[AttrGroupName]
  end

  def xmlattr_GroupName=(value)
    __xmlattr[AttrGroupName] = value
  end

  def initialize(dataplusGroupItem = [])
    @dataplusGroupItem = dataplusGroupItem
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QADataSet
#   iD - (any)
#   name - SOAP::SOAPString
class QADataSet
  attr_accessor :iD
  attr_accessor :name

  def initialize(iD = nil, name = nil)
    @iD = iD
    @name = name
  end
end

# {http://www.qas.com/web-2007-09}QALicensedSet
#   iD - SOAP::SOAPString
#   description - SOAP::SOAPString
#   copyright - SOAP::SOAPString
#   version - SOAP::SOAPString
#   baseCountry - SOAP::SOAPString
#   status - SOAP::SOAPString
#   server - SOAP::SOAPString
#   warningLevel - LicenceWarningLevel
#   daysLeft - SOAP::SOAPNonNegativeInteger
#   dataDaysLeft - SOAP::SOAPNonNegativeInteger
#   licenceDaysLeft - SOAP::SOAPNonNegativeInteger
class QALicensedSet
  attr_accessor :iD
  attr_accessor :description
  attr_accessor :copyright
  attr_accessor :version
  attr_accessor :baseCountry
  attr_accessor :status
  attr_accessor :server
  attr_accessor :warningLevel
  attr_accessor :daysLeft
  attr_accessor :dataDaysLeft
  attr_accessor :licenceDaysLeft

  def initialize(iD = nil, description = nil, copyright = nil, version = nil, baseCountry = nil, status = nil, server = nil, warningLevel = nil, daysLeft = nil, dataDaysLeft = nil, licenceDaysLeft = nil)
    @iD = iD
    @description = description
    @copyright = copyright
    @version = version
    @baseCountry = baseCountry
    @status = status
    @server = server
    @warningLevel = warningLevel
    @daysLeft = daysLeft
    @dataDaysLeft = dataDaysLeft
    @licenceDaysLeft = licenceDaysLeft
  end
end

# {http://www.qas.com/web-2007-09}QAExampleAddress
#   address - QAAddressType
#   comment - SOAP::SOAPString
class QAExampleAddress
  attr_accessor :address
  attr_accessor :comment

  def initialize(address = nil, comment = nil)
    @address = address
    @comment = comment
  end
end

# {http://www.qas.com/web-2007-09}QALayout
#   name - SOAP::SOAPString
#   comment - SOAP::SOAPString
class QALayout
  attr_accessor :name
  attr_accessor :comment

  def initialize(name = nil, comment = nil)
    @name = name
    @comment = comment
  end
end

# {http://www.qas.com/web-2007-09}PromptLine
#   prompt - SOAP::SOAPString
#   suggestedInputLength - SOAP::SOAPNonNegativeInteger
#   example - SOAP::SOAPString
class PromptLine
  attr_accessor :prompt
  attr_accessor :suggestedInputLength
  attr_accessor :example

  def initialize(prompt = nil, suggestedInputLength = nil, example = nil)
    @prompt = prompt
    @suggestedInputLength = suggestedInputLength
    @example = example
  end
end

# {http://www.qas.com/web-2007-09}QAConfigType
#   iniFile - SOAP::SOAPString
#   iniSection - SOAP::SOAPString
class QAConfigType
  attr_accessor :iniFile
  attr_accessor :iniSection

  def initialize(iniFile = nil, iniSection = nil)
    @iniFile = iniFile
    @iniSection = iniSection
  end
end

# {http://www.qas.com/web-2007-09}EngineEnumType
class EngineEnumType < ::String
  Keyfinder = EngineEnumType.new("Keyfinder")
  Singleline = EngineEnumType.new("Singleline")
  Typedown = EngineEnumType.new("Typedown")
  Verification = EngineEnumType.new("Verification")
end

# {http://www.qas.com/web-2007-09}EngineIntensityType
class EngineIntensityType < ::String
  Close = EngineIntensityType.new("Close")
  Exact = EngineIntensityType.new("Exact")
  Extensive = EngineIntensityType.new("Extensive")
end

# {http://www.qas.com/web-2007-09}PromptSetType
class PromptSetType < ::String
  Alternate = PromptSetType.new("Alternate")
  Alternate2 = PromptSetType.new("Alternate2")
  Alternate3 = PromptSetType.new("Alternate3")
  Default = PromptSetType.new("Default")
  Generic = PromptSetType.new("Generic")
  OneLine = PromptSetType.new("OneLine")
  Optimal = PromptSetType.new("Optimal")
end

# {http://www.qas.com/web-2007-09}VerifyLevelType
class VerifyLevelType < ::String
  InteractionRequired = VerifyLevelType.new("InteractionRequired")
  Multiple = VerifyLevelType.new("Multiple")
  None = VerifyLevelType.new("None")
  PremisesPartial = VerifyLevelType.new("PremisesPartial")
  StreetPartial = VerifyLevelType.new("StreetPartial")
  Verified = VerifyLevelType.new("Verified")
end

# {http://www.qas.com/web-2007-09}LineContentType
class LineContentType < ::String
  Address = LineContentType.new("Address")
  Ancillary = LineContentType.new("Ancillary")
  DataPlus = LineContentType.new("DataPlus")
  Name = LineContentType.new("Name")
  None = LineContentType.new("None")
end

# {http://www.qas.com/web-2007-09}LicenceWarningLevel
class LicenceWarningLevel < ::String
  ClicksLow = LicenceWarningLevel.new("ClicksLow")
  DataExpired = LicenceWarningLevel.new("DataExpired")
  DataExpiring = LicenceWarningLevel.new("DataExpiring")
  DataUnreadable = LicenceWarningLevel.new("DataUnreadable")
  EvalLicenceExpired = LicenceWarningLevel.new("EvalLicenceExpired")
  Evaluation = LicenceWarningLevel.new("Evaluation")
  FullLicenceExpired = LicenceWarningLevel.new("FullLicenceExpired")
  LicenceExpiring = LicenceWarningLevel.new("LicenceExpiring")
  LicenceNotFound = LicenceWarningLevel.new("LicenceNotFound")
  NoClicks = LicenceWarningLevel.new("NoClicks")
  None = LicenceWarningLevel.new("None")
end

# {http://www.qas.com/web-2007-09}QASearch
#   country - (any)
#   engine - EngineType
#   layout - SOAP::SOAPString
#   qAConfig - QAConfigType
#   search - SOAP::SOAPString
class QASearch
  attr_accessor :country
  attr_accessor :engine
  attr_accessor :layout
  attr_accessor :qAConfig
  attr_accessor :search

  def initialize(country = nil, engine = nil, layout = nil, qAConfig = nil, search = nil)
    @country = country
    @engine = engine
    @layout = layout
    @qAConfig = qAConfig
    @search = search
  end
end

# {http://www.qas.com/web-2007-09}QABulkSearch
#   country - (any)
#   engine - EngineType
#   layout - SOAP::SOAPString
#   qAConfig - QAConfigType
#   bulkSearchTerm - QASearchType
class QABulkSearch
  attr_accessor :country
  attr_accessor :engine
  attr_accessor :layout
  attr_accessor :qAConfig
  attr_accessor :bulkSearchTerm

  def initialize(country = nil, engine = nil, layout = nil, qAConfig = nil, bulkSearchTerm = nil)
    @country = country
    @engine = engine
    @layout = layout
    @qAConfig = qAConfig
    @bulkSearchTerm = bulkSearchTerm
  end
end

# {http://www.qas.com/web-2007-09}QASearchResult
#   qAPicklist - QAPicklistType
#   qAAddress - QAAddressType
#   xmlattr_VerifyLevel - SOAP::SOAPString
class QASearchResult
  AttrVerifyLevel = XSD::QName.new(nil, "VerifyLevel")

  attr_accessor :qAPicklist
  attr_accessor :qAAddress

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VerifyLevel
    __xmlattr[AttrVerifyLevel]
  end

  def xmlattr_VerifyLevel=(value)
    __xmlattr[AttrVerifyLevel] = value
  end

  def initialize(qAPicklist = nil, qAAddress = nil)
    @qAPicklist = qAPicklist
    @qAAddress = qAAddress
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QABulkSearchResult
#   bulkAddress - QABulkSearchItemType
#   bulkError - SOAP::SOAPString
#   errorCode - SOAP::SOAPString
#   xmlattr_Count - SOAP::SOAPString
#   xmlattr_SearchCount - SOAP::SOAPString
class QABulkSearchResult
  AttrCount = XSD::QName.new(nil, "Count")
  AttrSearchCount = XSD::QName.new(nil, "SearchCount")

  attr_accessor :bulkAddress
  attr_accessor :bulkError
  attr_accessor :errorCode

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Count
    __xmlattr[AttrCount]
  end

  def xmlattr_Count=(value)
    __xmlattr[AttrCount] = value
  end

  def xmlattr_SearchCount
    __xmlattr[AttrSearchCount]
  end

  def xmlattr_SearchCount=(value)
    __xmlattr[AttrSearchCount] = value
  end

  def initialize(bulkAddress = [], bulkError = nil, errorCode = nil)
    @bulkAddress = bulkAddress
    @bulkError = bulkError
    @errorCode = errorCode
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QARefine
#   moniker - SOAP::SOAPString
#   refinement - SOAP::SOAPString
#   qAConfig - QAConfigType
#   xmlattr_Threshold - SOAP::SOAPPositiveInteger
#   xmlattr_Timeout - SOAP::SOAPNonNegativeInteger
class QARefine
  AttrThreshold = XSD::QName.new(nil, "Threshold")
  AttrTimeout = XSD::QName.new(nil, "Timeout")

  attr_accessor :moniker
  attr_accessor :refinement
  attr_accessor :qAConfig

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Threshold
    __xmlattr[AttrThreshold]
  end

  def xmlattr_Threshold=(value)
    __xmlattr[AttrThreshold] = value
  end

  def xmlattr_Timeout
    __xmlattr[AttrTimeout]
  end

  def xmlattr_Timeout=(value)
    __xmlattr[AttrTimeout] = value
  end

  def initialize(moniker = nil, refinement = nil, qAConfig = nil)
    @moniker = moniker
    @refinement = refinement
    @qAConfig = qAConfig
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}Picklist
#   qAPicklist - QAPicklistType
class Picklist
  attr_accessor :qAPicklist

  def initialize(qAPicklist = nil)
    @qAPicklist = qAPicklist
  end
end

# {http://www.qas.com/web-2007-09}QAGetAddress
#   layout - SOAP::SOAPString
#   moniker - SOAP::SOAPString
#   qAConfig - QAConfigType
class QAGetAddress
  attr_accessor :layout
  attr_accessor :moniker
  attr_accessor :qAConfig

  def initialize(layout = nil, moniker = nil, qAConfig = nil)
    @layout = layout
    @moniker = moniker
    @qAConfig = qAConfig
  end
end

# {http://www.qas.com/web-2007-09}Address
#   qAAddress - QAAddressType
class Address
  attr_accessor :qAAddress

  def initialize(qAAddress = nil)
    @qAAddress = qAAddress
  end
end

# {http://www.qas.com/web-2007-09}QAData
class QAData < ::Array
end

# {http://www.qas.com/web-2007-09}QAGetData
class QAGetData
  def initialize
  end
end

# {http://www.qas.com/web-2007-09}QAGetLicenseInfo
class QAGetLicenseInfo
  def initialize
  end
end

# {http://www.qas.com/web-2007-09}QAGetSystemInfo
class QAGetSystemInfo
  def initialize
  end
end

# {http://www.qas.com/web-2007-09}QAGetDataMapDetail
#   dataMap - (any)
class QAGetDataMapDetail
  attr_accessor :dataMap

  def initialize(dataMap = nil)
    @dataMap = dataMap
  end
end

# {http://www.qas.com/web-2007-09}QADataMapDetail
#   warningLevel - LicenceWarningLevel
#   licensedSet - QALicensedSet
class QADataMapDetail
  attr_accessor :warningLevel
  attr_accessor :licensedSet

  def initialize(warningLevel = nil, licensedSet = [])
    @warningLevel = warningLevel
    @licensedSet = licensedSet
  end
end

# {http://www.qas.com/web-2007-09}QALicenceInfo
#   warningLevel - LicenceWarningLevel
#   licensedSet - QALicensedSet
class QALicenceInfo
  attr_accessor :warningLevel
  attr_accessor :licensedSet

  def initialize(warningLevel = nil, licensedSet = [])
    @warningLevel = warningLevel
    @licensedSet = licensedSet
  end
end

# {http://www.qas.com/web-2007-09}QASystemInfo
class QASystemInfo < ::Array
end

# {http://www.qas.com/web-2007-09}QAGetExampleAddresses
#   country - (any)
#   layout - SOAP::SOAPString
#   qAConfig - QAConfigType
class QAGetExampleAddresses
  attr_accessor :country
  attr_accessor :layout
  attr_accessor :qAConfig

  def initialize(country = nil, layout = nil, qAConfig = nil)
    @country = country
    @layout = layout
    @qAConfig = qAConfig
  end
end

# {http://www.qas.com/web-2007-09}QAExampleAddresses
class QAExampleAddresses < ::Array
end

# {http://www.qas.com/web-2007-09}QAGetLayouts
#   country - (any)
#   qAConfig - QAConfigType
class QAGetLayouts
  attr_accessor :country
  attr_accessor :qAConfig

  def initialize(country = nil, qAConfig = nil)
    @country = country
    @qAConfig = qAConfig
  end
end

# {http://www.qas.com/web-2007-09}QALayouts
class QALayouts < ::Array
end

# {http://www.qas.com/web-2007-09}QAGetPromptSet
#   country - (any)
#   engine - EngineType
#   promptSet - PromptSetType
#   qAConfig - QAConfigType
class QAGetPromptSet
  attr_accessor :country
  attr_accessor :engine
  attr_accessor :promptSet
  attr_accessor :qAConfig

  def initialize(country = nil, engine = nil, promptSet = nil, qAConfig = nil)
    @country = country
    @engine = engine
    @promptSet = promptSet
    @qAConfig = qAConfig
  end
end

# {http://www.qas.com/web-2007-09}QAPromptSet
#   line - PromptLine
#   xmlattr_Dynamic - SOAP::SOAPBoolean
class QAPromptSet
  AttrDynamic = XSD::QName.new(nil, "Dynamic")

  attr_accessor :line

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Dynamic
    __xmlattr[AttrDynamic]
  end

  def xmlattr_Dynamic=(value)
    __xmlattr[AttrDynamic] = value
  end

  def initialize(line = [])
    @line = line
    @__xmlattr = {}
  end
end

# {http://www.qas.com/web-2007-09}QACanSearch
#   country - (any)
#   engine - EngineType
#   layout - SOAP::SOAPString
#   qAConfig - QAConfigType
class QACanSearch
  attr_accessor :country
  attr_accessor :engine
  attr_accessor :layout
  attr_accessor :qAConfig

  def initialize(country = nil, engine = nil, layout = nil, qAConfig = nil)
    @country = country
    @engine = engine
    @layout = layout
    @qAConfig = qAConfig
  end
end

# {http://www.qas.com/web-2007-09}QASearchOk
#   isOk - SOAP::SOAPBoolean
#   errorCode - SOAP::SOAPString
#   errorMessage - SOAP::SOAPString
#   errorDetail - SOAP::SOAPString
class QASearchOk
  attr_accessor :isOk
  attr_accessor :errorCode
  attr_accessor :errorMessage
  attr_accessor :errorDetail

  def initialize(isOk = nil, errorCode = nil, errorMessage = nil, errorDetail = [])
    @isOk = isOk
    @errorCode = errorCode
    @errorMessage = errorMessage
    @errorDetail = errorDetail
  end
end

# {http://www.qas.com/web-2007-09}QAFault
#   errorCode - SOAP::SOAPString
#   errorMessage - SOAP::SOAPString
#   errorDetail - SOAP::SOAPString
class QAFault < ::StandardError
  attr_accessor :errorCode
  attr_accessor :errorMessage
  attr_accessor :errorDetail

  def initialize(errorCode = nil, errorMessage = nil, errorDetail = [])
    @errorCode = errorCode
    @errorMessage = errorMessage
    @errorDetail = errorDetail
  end
end
