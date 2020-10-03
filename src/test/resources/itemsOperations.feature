Feature: Project
  @Ivan
  Scenario: As a user I want to create a ITEM

    Given I have authentication to todo.ly
    # ------------------------------------------------- CREAR ITEM ---------------------------------------
    When I send POST request 'api/items.json' with json
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
        "OwnerId":676063
    }
    """
    And I get the property value 'Id' and save on ITEM_ID
    And I get the property value 'Content' and save on ITEM_NAME

    # ------------------------------------------------- ACTUALIZAR ITEM ---------------------------------------
    When I send PUT request 'api/items/ITEM_ID.json' with json
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
        "OwnerId": 676063
    }
    """

    # ------------------------------------------------- ELIMINAR ITEM ---------------------------------------

    When I send DELETE request 'api/items/ITEM_ID.json' with json
    """
    """
    Then I expected the response code 200

    # ------------------------------------------------- OBTENER ITEM POR ID ---------------------------------------

    When I send GET request 'api/items/ITEM_ID.json' with json
    """
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
        "Deleted": true,
        "Notes": "",
        "InHistory": true,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": 676063
    }
    """