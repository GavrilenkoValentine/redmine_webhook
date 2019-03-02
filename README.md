Redmine WebHook Plugin
======================

A Redmine plugin posts webhook on creating and updating tickets.


Install
------------------------------
Type below commands:

    $ cd $RAILS_ROOT/plugins
    $ git clone https://github.com/suer/redmine_webhook.git
    $ rake redmine:plugins:migrate RAILS_ENV=production

Then, restart your redmine.

Post Data Example
------------------------------

### Issue opened

    {
      "payload": {
        "action": "opened",
        "issue": {
          "id": 191,
          "subject": "Found a bug",
          "description": "I'm having a problem with this.",
          "created_on": "2014-03-01T15:17:48Z",
          "updated_on": "2014-03-01T15:17:48Z",
          "closed_on": null,
          "root_id": 191,
          "parent_id": null,
          "done_ratio": 0,
          "start_date": "2014-03-02",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 0,
          "custom_fields":
            [ { "id": 4,
                "name": "Planned start",
                "value": ''
              },
              { "id": 5,
                "name": "Planned end",
                "value": ''
              },
              { "id": 7,
                "name": "Deadline",
                "value": "2019-03-04"
              },
              { "id": 9,
                "name": "Without test",
                "value": 1
              },
              { "id": 19,
                "name": "Channel name",
                "value": ''
               } ],
          "project": {
            "id": 4,
            "identifier": "test",
            "name": "Test Project",
            "description": "",
            "created_on": "2013-01-12T11:50:26Z",
            "homepage": ""
          },
          "status": {
            "id": 1,
            "name": "new"
          },
          "tracker": {
            "id": 1,
            "name": "bug"
          },
          "priority": {
            "id": 2,
            "name": "normal"
          },  
          "author": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },             
          "assignee": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },
          "watchers":
            [ { "id": 3,
                "login": "test",
                "mail": "test@example.com",
                "firstname": "test",
                "lastname": "user"
              },
              { "id": 3,
                "login": "test",
                "mail": "test@example.com",
                "firstname": "test",
                "lastname": "user"
              }
          ],
        },
        "url": "https://example.com"
      }
    }




### Issue updated

    {
      "payload": {
        "action": "updated",
        "issue": {
          "id": 191,
          "subject": "Found a bug",
          "description": "I'm having a problem with this.",
          "created_on": "2014-03-01T15:17:48Z",
          "updated_on": "2014-03-01T15:17:48Z",
          "closed_on": null,
          "root_id": 191,
          "parent_id": null,
          "done_ratio": 0,
          "start_date": "2014-03-02",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 0,
          "custom_fields":
            [ { "id": 4,
                "name": "Planned start",
                "value": ''
              },
              { "id": 5,
                "name": "Planned end",
                "value": ''
              },
              { "id": 7,
                "name": "Deadline",
                "value": "2019-03-04"
              },
              { "id": 9,
                "name": "Without test",
                "value": 1
              },
              { "id": 19,
                "name": "Channel name",
                "value": ''
               } ],
          "project": {
            "id": 4,
            "identifier": "test",
            "name": "Test Project",
            "description": "",
            "created_on": "2013-01-12T11:50:26Z",
            "homepage": ""
          },
          "status": {
            "id": 1,
            "name": "new"
          },
          "tracker": {
            "id": 1,
            "name": "bug"
          },
          "priority": {
            "id": 2,
            "name": "normal"
          },  
          "author": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },             
          "assignee": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },
          "watchers":
            [ { "id": 3,
                "login": "test",
                "mail": "test@example.com",
                "firstname": "test",
                "lastname": "user"
              },
              { "id": 3,
                "login": "test",
                "mail": "test@example.com",
                "firstname": "test",
                "lastname": "user"
              }
          ],
        },
        "journal": {
          "id": 6363,
          "notes": '',
          "created_on": "2019-03-02T06:25:52.005Z",
          "private_notes": false,
          "author": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },
          "details":
            [ { "id": 78,
                "value": "New value",
                "old_value": '',
                "prop_key:"" 19,
                "property": "cf"
          } ]
        },
        "url": "https://example.com"
      }
    }




### Issue changeset

    {
      "payload": {
        "action": "changeset",
        "issue": {
          "id": 191,
          "subject": "Found a bug",
          "description": "I'm having a problem with this.",
          "created_on": "2014-03-01T15:17:48Z",
          "updated_on": "2014-03-01T15:17:48Z",
          "closed_on": null,
          "root_id": 191,
          "parent_id": null,
          "done_ratio": 0,
          "start_date": "2014-03-02",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 0,
          "custom_fields":
            [ { "id": 4,
                "name": "Planned start",
                "value": ''
              },
              { "id": 5,
                "name": "Planned end",
                "value": ''
              },
              { "id": 7,
                "name": "Deadline",
                "value": "2019-03-04"
              },
              { "id": 9,
                "name": "Without test",
                "value": 1
              },
              { "id": 19,
                "name": "Channel name",
                "value": ''
               } ],
          "project": {
            "id": 4,
            "identifier": "test",
            "name": "Test Project",
            "description": "",
            "created_on": "2013-01-12T11:50:26Z",
            "homepage": ""
          },
          "status": {
            "id": 1,
            "name": "new"
          },
          "tracker": {
            "id": 1,
            "name": "bug"
          },
          "priority": {
            "id": 2,
            "name": "normal"
          },  
          "author": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },             
          "assignee": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },
          "watchers":
            [ { "id": 3,
                "login": "test",
                "mail": "test@example.com",
                "firstname": "test",
                "lastname": "user"
              },
              { "id": 3,
                "login": "test",
                "mail": "test@example.com",
                "firstname": "test",
                "lastname": "user"
              }
          ],
        },
        "changeset": {
          "id": 5,
          "committer": "test user <test@example.com>",
          "committed_on": "2019-03-02T06:25:52.005Z",
          "commit_link": '<https://example.com/projects/test_project/repository/revisions/c55c3f3078ee8812153bcaef3318e5ac3d4edcc6|description of commit_4 | verif #191>'
        },
        "journal": {
          "id": null,
          "notes": 'Applied in changeset commit:test|c55c3f3078ee8812153bcaef3318e5ac3d4edcc6.',
          "created_on": "null",
          "private_notes": false,
          "author": {
            "id": 3,
            "login": "test",
            "mail": "test@example.com",
            "firstname": "test",
            "lastname": "user"
          },
          "details":
            []
        },
        "url": "https://example.com"
      }
    }



Requirements
------------------------------
* Redmine 2.4, 2.6, 3.0


License
------------------------------
The MIT License (MIT)
Copyright (c) suer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
