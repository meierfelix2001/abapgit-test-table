CLASS lhc_ZTRAVELTEST DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.




    METHODS create_travel     FOR MODIFY

      IMPORTING it_travel_create FOR CREATE ztraveltest.




ENDCLASS.




CLASS lhc_ZTRAVELTEST IMPLEMENTATION.




  METHOD create_travel.

    DATA:

      lt_travel TYPE TABLE OF /dmo/travel,

      ls_travel LIKE LINE OF lt_travel.




    LOOP AT it_travel_create ASSIGNING FIELD-SYMBOL(<fs_travel_create>).

      ls_travel-agency_id = <fs_travel_create>-AgencyID.

      ls_travel-begin_date = <fs_travel_create>-BeginDate.

      ls_travel-customer_id = <fs_travel_create>-CustomerID.

      ls_travel-end_date =  <fs_travel_create>-EndDate.

      ls_travel-lastchangedat = <fs_travel_create>-LastChangedAt.

      ls_travel-description = <fs_travel_create>-Memo.

      ls_travel-status = <fs_travel_create>-Status.

      ls_travel-travel_id = <fs_travel_create>-TravelID.

      APPEND ls_travel TO lt_travel.

    ENDLOOP.




    INSERT /dmo/travel FROM TABLE @lt_travel.

  ENDMETHOD.




ENDCLASS.
