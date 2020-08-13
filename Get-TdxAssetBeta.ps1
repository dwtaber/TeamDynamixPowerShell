function Get-TdxAssetBeta
{
    [CmdletBinding()]
    param
    (
        # Retrieve a single asset by its ID.  Using this parameter returns information that is not returned when using the other parameter sets, such as custom attributes.
        [Alias("ID")]
        [Parameter(
            ParameterSetName = "IDLookup",
            Mandatory = $true,
            Position = 0
        )]
        [int]
        $AssetID,

        # Return multiple assets by one or more criteria.
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "SearchObject",
            Position = 0
        )]
        [System.Collections.IDictionary]
        $SearchObject,

        # Sets whether to look at production assets or sandbox assets.
        [Alias("Sb")]
        [Parameter(
            Mandatory = $false
        )]
        [switch]
        $Sandbox,

        # Filter parameters start here

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [datetime]
        $AcquisitionDateAfter,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [datetime]
        $AcquisitionDateBefore,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [datetime]
        $ContractDateAfter,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [datetime]
        $ContractDateBefore,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $ContractID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int]
        $ContractProviderID,

        # This one will need additional consideration
        #
        # [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        # []
        # $CustomAttribute,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $ExcludeContractID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $ExcludeTicketID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [datetime]
        $ExpectedReplacementAfter,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [datetime]
        $ExpectedReplacementBefore,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [string[]]
        $ExternalID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $FormID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [switch]
        $InService,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $LocationID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $MaintenanceScheduleID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $ManufacturerID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int]
        $MaxResults,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [switch]
        $ExcludeChildAssets,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [guid[]]
        $OwningCustomerID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [guid[]]
        $PreviousOwningCustomerID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $OwningDepartmentID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $PreviousOwningDepartmentID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $ParentID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $ProductModelID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [double]
        $PurchaseCostMinimum,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [double]
        $PurchaseCostMaximum,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [guid]
        $RequestingCustomerID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $RequestingDepartmentID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int]
        $RoomID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int]
        $SavedSearchID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [string]
        $SearchText,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [string]
        $SerialNumberLike,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $StatusID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $PreviousStatusID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $SupplierID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $TicketID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [guid[]]
        $UsingCustomerID,

        [Parameter( Mandatory = $false, ParameterSetName = "SearchParameters" )]
        [int[]]
        $UsingDepartmentID
    )

    begin
    {
        $BaseUriLeaf = "/733/assets"
        $Splat = @{}

        $Splat["Sandbox"] = $Sandbox

        if ($PSCmdlet.ParameterSetName -eq "IDLookup")
        {
            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get
            $Splat["UriLeaf"] = "$BaseUriLeaf/$AssetID"
        }
        else
        {
            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Post
            $Splat["UriLeaf"] = "$BaseUriLeaf/search"

            if ($PSCmdlet.ParameterSetName -eq "SearchParameters")
            {
                $Splat["Body"] = SearchParametersToJson $Script:TicketSearchParams
            }

            elseif ($PSCmdlet.ParameterSetName -eq "SearchObject")
            {
                $Splat["Body"] = $SearchObject | ConvertTo-Json -Depth 10
            }
        }
    }

    process
    {
        Write-Verbose "Splat:`r`n$Splat"
        Write-Verbose "Body:`r`n$($Splat['Body'])"
        $Response = Invoke-TdxMethod @Splat
    }

    end
    {
        return $Response
    }
}