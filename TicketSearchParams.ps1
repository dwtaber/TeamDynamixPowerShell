# using namespace System.Collections.Generic

$Script:TicketSearchParams = [Dictionary[[string],[string]]]::new()

$Script:TicketSearchParams["AcquisitionDateAfter"]          = "AcquisitionDateFrom"
$Script:TicketSearchParams["AcquisitionDateBefore"]         = "AcquisitionDateTo"
$Script:TicketSearchParams["ContractDateAfter"]             = "ContractEndDateFrom"
$Script:TicketSearchParams["ContractDateBefore"]            = "ContractEndDateTo"
$Script:TicketSearchParams["ContractID"]                    = "ContractIDs"
$Script:TicketSearchParams["ContractProviderID"]            = "ContractProviderID"
$Script:TicketSearchParams["CustomAttribute"]               = "CustomAttributes"
$Script:TicketSearchParams["ExcludeContractID"]             = "ExcludeContractIDs"
$Script:TicketSearchParams["ExcludeTicketID"]               = "ExcludeTicketIDs"
$Script:TicketSearchParams["ExpectedReplacementAfter"]      = "ExpectedReplacementDateFrom"
$Script:TicketSearchParams["ExpectedReplacementBefore"]     = "ExpectedReplacementDateTo"
$Script:TicketSearchParams["ExternalID"]                    = "ExternalIDs"
$Script:TicketSearchParams["FormID"]                        = "FormIDs"
$Script:TicketSearchParams["InService"]                     = "IsInService"
$Script:TicketSearchParams["LocationID"]                    = "LocationIDs"
$Script:TicketSearchParams["MaintenanceScheduleID"]         = "MaintenanceScheduleIDs"
$Script:TicketSearchParams["ManufacturerID"]                = "ManufacturerIDs"
$Script:TicketSearchParams["MaxResults"]                    = "MaxResults"
$Script:TicketSearchParams["ExcludeChildAssets"]            = "OnlyParentAssets"
$Script:TicketSearchParams["OwningCustomerID"]              = "OwningCustomerIDs"
$Script:TicketSearchParams["PreviousOwningCustomerID"]      = "OwningCustomerIDsPast"
$Script:TicketSearchParams["OwningDepartmentID"]            = "OwningDepartmentIDs"
$Script:TicketSearchParams["PreviousOwningDepartmentID"]    = "OwningDepartmentIDsPast"
$Script:TicketSearchParams["ParentID"]                      = "ParentIDs"
$Script:TicketSearchParams["ProductModelID"]                = "ProductModelIDs"
$Script:TicketSearchParams["PurchaseCostMinimum"]           = "PurchaseCostFrom"
$Script:TicketSearchParams["PurchaseCostMaximum"]           = "PurchaseCostTo"
$Script:TicketSearchParams["RequestingCustomerID"]          = "RequestingCustomerIDs"
$Script:TicketSearchParams["RequestingDepartmentID"]        = "RequestingDepartmentIDs"
$Script:TicketSearchParams["RoomID"]                        = "RoomID"
$Script:TicketSearchParams["SavedSearchID"]                 = "SavedSearchID"
$Script:TicketSearchParams["SearchText"]                    = "SearchText"
$Script:TicketSearchParams["SerialNumberLike"]              = "SerialLike"
$Script:TicketSearchParams["StatusID"]                      = "StatusIDs"
$Script:TicketSearchParams["PreviousStatusID"]              = "StatusIDsPast"
$Script:TicketSearchParams["SupplierID"]                    = "SupplierIDs"
$Script:TicketSearchParams["TicketID"]                      = "TicketIDs"
$Script:TicketSearchParams["UsingCustomerID"]               = "UsingCustomerIDs"
$Script:TicketSearchParams["UsingDepartmentID"]             = "UsingDepartmentIDs"