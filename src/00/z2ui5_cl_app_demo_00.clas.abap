CLASS z2ui5_cl_app_demo_00 DEFINITION PUBLIC.

  PUBLIC SECTION.

    INTERFACES z2ui5_if_app.

    DATA product TYPE string.
    DATA quantity TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z2ui5_cl_app_demo_00 IMPLEMENTATION.


  METHOD z2ui5_if_app~controller.

    CASE client->get( )-lifecycle_method.

      WHEN client->cs-lifecycle_method-on_init.
        product = 'tomato'.
        quantity = '500'.


      WHEN client->cs-lifecycle_method-on_event.

        CASE client->get( )-event.

          WHEN 'BUTTON_POST'.
            client->display_message_toast( |{ product } { quantity } ST - GR successful| ).

          WHEN '0101'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_01( ) ).

          WHEN '0102'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_04( ) ).

          WHEN '0103'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_08( ) ).

          WHEN '0104'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_10( ) ).

          WHEN '0201'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_02( ) ).

          WHEN '0202'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_05( ) ).

          WHEN '0301'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_03( ) ).

          WHEN '0302'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_07( ) ).

          WHEN '0303'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_06( ) ).

          WHEN '0304'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_11( ) ).

          WHEN 'MIME_EDITOR'.
            client->nav_to_app( NEW z2ui5_cl_app_demo_14( ) ).

        ENDCASE.


      WHEN client->cs-lifecycle_method-on_rendering.

        DATA(view) = client->factory_view( ).

        DATA(page) = view->page( title = 'ABAP2UI5 - Applications and Examples' nav_button_tap = view->_event_display_id( client->get( )-id_prev_app )
            ).

        page->header_content(
            )->link( text = 'SCN' href = 'https://blogs.sap.com/tag/abap2ui5/'
            )->link( text = 'Twitter' href = 'https://twitter.com/OblomovDev'
            )->link( text = 'GitHub' href = 'https://github.com/oblomov-dev/abap2ui5' ).

        DATA(grid) = page->grid( default_span  = 'L12 M12 S12' )->content( 'l' ).
        grid = page->grid( default_span  = 'L4 M6 S12' )->content( 'l' ).

        grid->simple_form( 'HowTo - General' )->content( 'f'
            )->button( text = 'Client-Server Communication (Data Binding)' press = view->_event( '0101' )
            )->button( text = 'Controller (Events, Navigation)' press = view->_event( '0102' )
            )->button( text = 'Messages (Toast, Box, Strip, Error)' press = view->_event( '0103' )
            )->button( text = 'Layout (Header, Footer, Grid)' press = view->_event( '0104' ) ).

        grid->simple_form( 'HowTo - Selection-Screen' )->content( 'f'
            )->button( text = 'Basic' press = view->_event( '0201' )
            )->button( text = 'More Controls' press = view->_event( '0202' ) ).


        grid->simple_form( 'HowTo - List and Tables' )->content( 'f'
            )->button( text = 'List' press = view->_event( '0301' )
            )->button( text = 'Table' press = view->_event( '0302' )
            )->button( text = 'Table with Toolbar and Container' press = view->_event( '0303' )
            )->button( text = 'Table Editable' press = view->_event( '0304' ) ).

        grid = page->grid( default_span  = 'L12 M12 S12' ).


        DATA(form) = grid->simple_form( 'Applications - Demos, Templates, Examples' )->vbox( ).

        form->flex_box( class = 'columns'
        )->button( text = 'MIME Editor'  press = view->_event( 'MIME_EDITOR' )
           )->get(
              )->layout_data(
          )->flex_item_data(
                 grow_Factor = '1'
              style_class = 'sapUiTinyMargin'
         )->get_parent( )->get_parent(
     )->text( text = 'Use the sap.ui.codeeditor to develop editor apps - for instance upload/download files form the MIME Repository'
         )->get(
         )->layout_data(
          )->flex_item_data(
                 grow_Factor = '3'
           style_class = 'sapUiTinyMargin'
    ).

    RETURN.


    ENDCASE.

  ENDMETHOD.
ENDCLASS.
