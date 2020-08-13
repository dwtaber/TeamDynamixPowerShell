using namespace System.Collections.Generic

Class TdxAsset
{
    [datetime]$AcquisitionDate
    [int]$AppID
    [string]$AppName
    [TdxAttachment[]]$Attachments
    [TdxCustomAttribute[]]$Attributes
    [int]$ConfigurationItemID
    [datetime]$CreatedDate
    [string]$CreatedFullName
    [guid]$CreatedUid
    [datetime]$ExpectedReplacementDate
    [string]$ExternalID
    [int]$ExternalSourceID
    [string]$ExternalSourceName
    [int]$FormID
    [string]$FormName
    [int]$ID
    [int]$LocationID
    [string]$LocationName
    [int]$LocationRoomID
    [string]$LocationRoomName
    [int]$MaintenanceScheduleID
    [string]$MaintenanceScheduleName
    [int]$ManufacturerID
    [string]$ManufacturerName
    [datetime]$ModifiedDate
    [string]$ModifiedFullName
    [guid]$ModifiedUid
    [string]$Name
    [guid]$OwningCustomerID
    [string]$OwningCustomerName
    [int]$OwningDepartmentID
    [string]$OwningDepartmentName
    [int]$ParentID
    [string]$ParentName
    [string]$ParentSerialNumber
    [string]$ParentTag
    [int]$ProductModelID
    [string]$ProductModelName
    [double]$PurchaseCost
    [guid]$RequestingCustomerID
    [string]$RequestingCustomerName
    [int]$RequestingDepartmentID
    [string]$RequestingDepartmentName
    [string]$SerialNumber
    [int]$StatusID
    [string]$StatusName
    [int]$SupplierID
    [string]$SupplierName
    [string]$Tag
    [string]$Uri
}

function makeTdxAsset () {[TdxAsset]::new()}