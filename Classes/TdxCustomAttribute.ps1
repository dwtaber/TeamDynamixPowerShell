class TdxCustomAttributeChoice
{
    [int]$ID
    [string]$Name
    [bool]$IsActive
    [datetime]$DateCreated
    [datetime]$DateModified
    [int]$Order
}

class TdxCustomAttribute
{
    [int]$ID
    [string]$Name
    [int]$Order
    [string]$Description
    [int]$SectionID
    [string]$SectionName
    [string]$FieldType
    [string]$DataType
    [TdxCustomAttributeChoice[]]$Choices
    [bool]$IsRequired
    [bool]$IsUpdatable
    [string]$Value
    [string]$ValueText
    [string]$ChoicesText
    [int[]]$AssociatedItemIDs
}

function makeTdxCustomAttribute () {[TdxCustomAttribute]::new()}