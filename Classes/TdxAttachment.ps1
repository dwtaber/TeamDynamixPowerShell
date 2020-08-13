enum TdxAttachmentType
{
    None = 0
    Project = 1
    Issue = 3
    Announcement = 7
    Ticket = 9
    Forums = 13
    KnowledgeBase = 26
    Asset = 27
    Contract = 29
    Service = 47
    CalendarEvent = 57
    Expense = 62
    ConfigurationItem = 63
    Location = 71
    Risk = 72
    PortfolioIssue = 83
    PortfolioRisk = 84
}

class TdxAttachment
{
    [guid]$ID
    [TdxAttachmentType]$AttachmentType
    [int]$ItemID
    [guid]$CreatedUid
    [string]$CreatedFullName
    [datetime]$CreatedDate
    [string]$Name
    [int]$Size
    [string]$Uri
}

function makeTdxAttachment () { [TdxAttachment]::new()}