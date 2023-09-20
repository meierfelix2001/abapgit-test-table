@AbapCatalog.sqlViewName: 'ZTRAVELTESTVIEW'

@AbapCatalog.compiler.compareFilter: true

@AbapCatalog.preserveKey: true

@AccessControl.authorizationCheck: #CHECK

@EndUserText.label: 'Travel'

@Metadata.allowExtensions: true

define root view ZTRAVELTEST

  as select from /dmo/travel as Travel

  association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID

{

  key Travel.travel_id     as TravelID,

      Travel.agency_id     as AgencyID,

      Travel.customer_id   as CustomerID,

      Travel.begin_date    as BeginDate,

      Travel.end_date      as EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'

      Travel.booking_fee   as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'

      Travel.total_price   as TotalPrice,

      @Semantics.currencyCode: true

      Travel.currency_code as CurrencyCode,

      Travel.description   as Memo,

      Travel.status        as Status,

      Travel.lastchangedat as LastChangedAt,




      /* public associations */

      _Agency

}
