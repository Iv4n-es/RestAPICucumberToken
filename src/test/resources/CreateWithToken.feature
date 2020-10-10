Feature: Project
  @Ivan
  Scenario: I want to create a USER account
#    Create/Update/Delete/ de un proyecto y item utilizando el TOKEN en la authenticacion

    Given I have authentication to todo.ly

# CREAR USUARIO ----------------------------------------------------------------------------------

    When I send POST request 'api/user.json' with 'NO_AUTH' and json
    """
    {
        "Email": "examen_Modulo4_UCB_@gmail.com",
        "FullName": "Ivan Ulo Aruquipa",
        "Password": "abc123"
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": "EXCLUDE",
        "Email": "examen_Modulo4_UCB_@gmail.com",
        "Password": null,
        "FullName": "Ivan Ulo Aruquipa",
        "TimeZone": 0,
        "IsProUser": false,
        "DefaultProjectId": "EXCLUDE",
        "AddItemMoreExpanded": false,
        "EditDueDateMoreExpanded": false,
        "ListSortType": 0,
        "FirstDayOfWeek": 0,
        "NewTaskDueDate": -1,
        "TimeZoneId": "Pacific Standard Time"
    }
    """
    And I get the property value 'Id' and save on USER_ID
    And I get the property value 'Email' and save on USER_EMAIL


# ACTUALIZAR USUARIO ---------------------------------------------------------------------------------------

    When I am authenticated with the user 'USER_EMAIL' and password 'abc123'
    And I send PUT request 'api/user/0.json' with 'BASIC_AUTHENTICATION' and json
    """
    {
        "Email": "examen_Modulo4_UCB__ACTUALIZADO@gmail.com"
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": USER_ID,
        "Email": "examen_Modulo4_UCB__ACTUALIZADO@gmail.com",
        "Password": null,
        "FullName": "Ivan Ulo Aruquipa",
        "TimeZone": 0,
        "IsProUser": false,
        "DefaultProjectId": EXCLUDE,
        "AddItemMoreExpanded": false,
        "EditDueDateMoreExpanded": false,
        "ListSortType": 0,
        "FirstDayOfWeek": 0,
        "NewTaskDueDate": -1,
        "TimeZoneId": "Pacific Standard Time"
    }
    """
    And I get the property value 'Email' and save on USER_EMAIL

# SOLICITAR TOKEN ----------------------------------------------------------------------------------------

    When I am authenticated with the user 'USER_EMAIL' and password 'abc123'
    And I send GET request 'api/authentication/token.json' with 'BASIC_AUTHENTICATION' and json
    """
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "TokenString": "EXCLUDE",
        "UserEmail": "USER_EMAIL",
        "ExpirationTime": "EXCLUDE"
    }
    """
    And I get the property value 'TokenString' and save on TOKEN_STRING


# CREAR PROYECTO CON TOKEN DE AUTENTICACION -----------------------------------------------------------------------------------------

    When I send POST request 'api/projects.json' with 'TOKEN_AUTHENTICATION' and json
    """
    {
       "Content":"PROYECTO",
       "Icon": 4
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": "EXCLUDE",
        "Content": "PROYECTO",
        "ItemsCount": 0,
        "Icon": 4,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "EXCLUDE",
        "Children": [],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """
    And I get the property value 'Id' and save on ID_PROJECT
    And I get the property value 'Content' and save on NAME_PROJECT


# ACTUALIZA PROYECTO CON TOKEN DE AUTENTICACION ------------------------------------------------------------------------------------

    When I send PUT request 'api/projects/ID_PROJECT.json' with 'TOKEN_AUTHENTICATION' and json
    """
    {
       "Content":"NAME_PROJECT UPDATE",
       "Icon": 4
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": ID_PROJECT,
        "Content": "NAME_PROJECT UPDATE",
        "ItemsCount": 0,
        "Icon": 4,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "EXCLUDE",
        "Children": [],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """

# ELIMINA PROYECTO CON TOKEN DE AUTENTICACION ------------------------------------------------------------------------------------

    When I send DELETE request 'api/projects/ID_PROJECT.json' with 'TOKEN_AUTHENTICATION' and json
    """
    """
    Then I expected the response code 200


# CREA ITEM CON TOKEN DE AUTENTICACION ------------------------------------------------------------------------------------

    When I send POST request 'api/items.json' with 'TOKEN_AUTHENTICATION' and json
    """
    {
      "Content": "New Item"
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": "EXCLUDE",
        "Content": "New Item",
        "ItemType": 1,
        "Checked": false,
        "ProjectId": null,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": null,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": null,
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": null,
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "Notes": "",
        "InHistory": false,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId":"EXCLUDE"
    }
    """

    And I get the property value 'Id' and save on ITEM_ID
    And I get the property value 'Content' and save on ITEM_NAME

# ACTUALIZA ITEM CON TOKEN DE AUTENTICACION ------------------------------------------------------------------------------------

    When I send PUT request 'api/items/ITEM_ID.json' with 'TOKEN_AUTHENTICATION' and json
    """
    {
       "Checked": "true"
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
     {
        "Id": ITEM_ID,
        "Content": "ITEM_NAME",
        "ItemType": 1,
        "Checked": true,
        "ProjectId": null,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": null,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": null,
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "Notes": "",
        "InHistory": true,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": "EXCLUDE"
    }
    """

# ELIMINA ITEM CON TOKEN DE AUTENTICACION ------------------------------------------------------------------------------------

    When I send DELETE request 'api/items/ITEM_ID.json' with 'TOKEN_AUTHENTICATION' and json
    """
    """
    Then I expected the response code 200



# ELIMINA USUARIO CON TOKEN DE AUTENTICACION ------------------------------------------------------------------------------------

    When I send DELETE request '/api/user/0.json' with 'TOKEN_AUTHENTICATION' and json
    """
    """
    Then I expected the response code 200




