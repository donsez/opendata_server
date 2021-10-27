db.createUser(
    {
        user: "opendata",
        pwd: "__MY_SECRET_PASSWORD__",
        roles: [
            {
                role: "readWrite",
                db: "opendata"
            }
        ]
    }
);
