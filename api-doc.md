# group
## Issue [/issues]

### 一覧 [GET]

+ Response 200(application/json)

        [
            {
                id: 1,
                title: "Create Awesome Service",
                status: "open",
                comment_count: 1,
                assignee: {
                    id: 1,
                    name: "Akiko"
                },
                created_at: "2016-06-08T23:26:54.316+09:00",
                created: "約12時間前",
                updated_at: "2016-06-08T23:26:54.316+09:00",
                updated: "約12時間前",
                content: "Let's Rock!",
                comments: []
            }
        ]

### 作成 [POST]

+ Request (application/json)

    + Attribute
      + title: Create Awesome Service (string)
      + status: open (string)
      + content: Let's Rock! (string)
      + assignee_id: 1 (number)
      + label_ids: [1,2,3] (array)

+ Response 200(application/json)

        {
            id: 1,
            title: "Create Awesome Service",
            status: "open",
            comment_count: 1,
            content: "Let's Rock!",
            comments: [],
            labels: [
                { id: 1, name: "Good", color: #fff },
                { id: 2, name: "Nice", color: #ddd }
            ],
            assignee: {
                id: 1,
                name: "Akiko"
            },
            created_at: "2016-06-08T23:26:54.316+09:00",
            created: "約12時間前",
            updated_at: "2016-06-08T23:26:54.316+09:00",
            updated: "約12時間前"
        }

## Issue [/issues/{id}]

### 更新 [PUT]

+ parameter
  + id(integer)

+ Request (application/json)

    + Attribute
      + title: Create Awesome Service (string)
      + status: open (string)
      + content: Let's Rock! (string)
      + assignee_id: 1 (number)
      + label_ids: [1,2] (array)

+ Response 200(application/json)

        {
            id: 1,
            title: "Create Awesome Service",
            status: "open",
            comment_count: 1,
            content: "Let's Rock!",
            comments: [],
            labels: [
                { id: 1, name: "Good", color: #fff },
                { id: 2, name: "Nice", color: #ddd }
            ],
            assignee: {
                id: 1,
                name: "Akiko"
            },
            created_at: "2016-06-08T23:26:54.316+09:00",
            created: "約12時間前",
            updated_at: "2016-06-08T23:26:54.316+09:00",
            updated: "約12時間前"
        }

### 削除 [DELETE]

+ parameter
  + id(integer)

+ Response 200(application/json)

## Comment [/issues/{issue_id}/comments]

### 作成 [POST]

+ parameter
  + issue_id(integer)

+ Request (application/json)

    + Attribute
      + user_name: Kawai (string)
      + content: Good Issue (string)

+ Response 200(application/json)

        {
            id: 1,
            user_name: "Kawai",
            content: "Good Issue",
            issue_id: 1,
            created_at: "2016-06-08T23:26:54.316+09:00",
            created: "約12時間前",
            updated_at: "2016-06-08T23:26:54.316+09:00",
            updated: "約12時間前"
        }

## Comment [/issues/{issue_id}/comments/{comment_id}]

### 作成 [POST]

+ parameter
  + issue_id(integer)
  + comment_id(integer)

+ Request (application/json)

    + Attribute
      + user_name: Kawai (string)
      + content: Good Issue (string)

+ Response 200(application/json)

        {
            id: 1,
            user_name: "Kawai",
            content: "Good Issue",
            issue_id: 1,
            created_at: "2016-06-08T23:26:54.316+09:00",
            created: "約12時間前",
            updated_at: "2016-06-08T23:26:54.316+09:00",
            updated: "約12時間前"
        }

### 削除 [DELETE]

+ parameter
  + issue_id(integer)
  + comment_id(integer)

+ Response 200(application/json)

## User [/users]

### 一覧 [GET]

+ Response 200(application/json)

        [
            {
                id: 1,
                name: "Akiko"
            }
        ]

## Label [/labels]

### 一覧 [GET]

+ Response 200(application/json)

        [
            { id: 1, name: "Good", color: #fff },
            { id: 2, name: "Nice", color: #ddd }
        ]
