---
  title: "Postgres"
  library: "noflo-pg"
  layout: "component"

---

    EXPORT=SQL.IN:IN
    EXPORT=CLIENT.OUT:OUT
    EXPORT=CLIENT.ERROR:ERROR
    EXPORT=CLIENT.SERVER:SERVER
    EXPORT=SQL.TEMPLATE:TEMPLATE
    EXPORT=CLIENT.TOKEN:TOKEN
    EXPORT=CLIENT.QUIT:QUIT
    
    Sql(pg/Sql) OUT -> IN Client(pg/Client)
    