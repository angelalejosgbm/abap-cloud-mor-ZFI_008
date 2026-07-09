@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZFI_REP_FORMF07_01'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFI_REP_FORMF07_01 as select from I_UnitOfMeasure {
    key UnitOfMeasure,
    key IsPrimaryUnitForISOCode
}
