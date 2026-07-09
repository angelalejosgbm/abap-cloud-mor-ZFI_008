@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comp. Ret. 1% Casilla 170 formulario F07'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZFI_REP_FORMF07 as select from I_Withholdingtaxitem as _WithholdingTaxItem 
  association [0..1] to I_JournalEntry  as _JournalEntry
    on  $projection.CompanyCode      = _JournalEntry.CompanyCode
    and $projection.AccountingDocument = _JournalEntry.AccountingDocument
    and $projection.FiscalYear       = _JournalEntry.FiscalYear
  association [0..1] to I_Businesspartnertaxnumber  as _NIT
    on  $projection.CustomerSupplierAccount  = _NIT.BusinessPartner and
                    _NIT.BPTaxType = '9SV3'
  association [0..1] to I_Businesspartnertaxnumber  as _DUI
    on  $projection.CustomerSupplierAccount  = _DUI.BusinessPartner and
                    _DUI.BPTaxType = '9SV2'  
    
{
    key CompanyCode,
    key AccountingDocument,
    key FiscalYear,
    _NIT.BPTaxNumber as NIT,   
    _JournalEntry.PostingDate,
    @Semantics: { amount : {currencyCode: 'DocumentCurrency'} }
    WhldgTaxBaseAmtInTransacCrcy,
    @Semantics: { amount : {currencyCode: 'DocumentCurrency'} }
    WhldgTaxAmtInTransacCrcy,
    
    CustomerSupplierAccount,
    _DUI.BPTaxNumber as DUI,   
    
    '10' as NUM_ANE,
     
    DocumentCurrency
    
} where 
        WithholdingTaxCode = 'RA' and
        _JournalEntry.IsReversal = '' and
        _JournalEntry.IsReversed = ''
