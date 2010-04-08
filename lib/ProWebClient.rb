#!/usr/bin/env ruby
require 'QASDriver.rb'

endpoint_url = ARGV.shift
obj = QAPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   DoSearch(body)
#
# ARGS
#   body            QASearch - {http://www.qas.com/web-2007-09}QASearch
#
# RETURNS
#   body            QASearchResult - {http://www.qas.com/web-2007-09}QASearchResult
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doSearch(body)

# SYNOPSIS
#   DoBulkSearch(body)
#
# ARGS
#   body            QABulkSearch - {http://www.qas.com/web-2007-09}QABulkSearch
#
# RETURNS
#   body            QABulkSearchResult - {http://www.qas.com/web-2007-09}QABulkSearchResult
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doBulkSearch(body)

# SYNOPSIS
#   DoRefine(body)
#
# ARGS
#   body            QARefine - {http://www.qas.com/web-2007-09}QARefine
#
# RETURNS
#   body            Picklist - {http://www.qas.com/web-2007-09}Picklist
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doRefine(body)

# SYNOPSIS
#   DoGetAddress(body)
#
# ARGS
#   body            QAGetAddress - {http://www.qas.com/web-2007-09}QAGetAddress
#
# RETURNS
#   body            Address - {http://www.qas.com/web-2007-09}Address
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetAddress(body)

# SYNOPSIS
#   DoGetData(body)
#
# ARGS
#   body            QAGetData - {http://www.qas.com/web-2007-09}QAGetData
#
# RETURNS
#   body            QAData - {http://www.qas.com/web-2007-09}QAData
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetData(body)

# SYNOPSIS
#   DoGetDataMapDetail(body)
#
# ARGS
#   body            QAGetDataMapDetail - {http://www.qas.com/web-2007-09}QAGetDataMapDetail
#
# RETURNS
#   body            QADataMapDetail - {http://www.qas.com/web-2007-09}QADataMapDetail
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetDataMapDetail(body)

# SYNOPSIS
#   DoGetLicenseInfo(body)
#
# ARGS
#   body            QAGetLicenseInfo - {http://www.qas.com/web-2007-09}QAGetLicenseInfo
#
# RETURNS
#   body            QALicenceInfo - {http://www.qas.com/web-2007-09}QALicenceInfo
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetLicenseInfo(body)

# SYNOPSIS
#   DoGetSystemInfo(body)
#
# ARGS
#   body            QAGetSystemInfo - {http://www.qas.com/web-2007-09}QAGetSystemInfo
#
# RETURNS
#   body            QASystemInfo - {http://www.qas.com/web-2007-09}QASystemInfo
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetSystemInfo(body)

# SYNOPSIS
#   DoGetExampleAddresses(body)
#
# ARGS
#   body            QAGetExampleAddresses - {http://www.qas.com/web-2007-09}QAGetExampleAddresses
#
# RETURNS
#   body            QAExampleAddresses - {http://www.qas.com/web-2007-09}QAExampleAddresses
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetExampleAddresses(body)

# SYNOPSIS
#   DoGetLayouts(body)
#
# ARGS
#   body            QAGetLayouts - {http://www.qas.com/web-2007-09}QAGetLayouts
#
# RETURNS
#   body            QALayouts - {http://www.qas.com/web-2007-09}QALayouts
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetLayouts(body)

# SYNOPSIS
#   DoGetPromptSet(body)
#
# ARGS
#   body            QAGetPromptSet - {http://www.qas.com/web-2007-09}QAGetPromptSet
#
# RETURNS
#   body            QAPromptSet - {http://www.qas.com/web-2007-09}QAPromptSet
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doGetPromptSet(body)

# SYNOPSIS
#   DoCanSearch(body)
#
# ARGS
#   body            QACanSearch - {http://www.qas.com/web-2007-09}QACanSearch
#
# RETURNS
#   body            QASearchOk - {http://www.qas.com/web-2007-09}QASearchOk
#
# RAISES
#   body            QAFault - {http://www.qas.com/web-2007-09}QAFault
#
body = nil
puts obj.doCanSearch(body)


