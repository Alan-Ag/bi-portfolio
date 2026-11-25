import os, glob
import pandas as pd
from sqlalchemy import create_engine

# Le mot de passe est lu depuis le terminal, jamais écrit dans le fichier
engine = create_engine(os.environ["DATABASE_URL"])

for path in sorted(glob.glob("olist/*.csv")):
    name = os.path.basename(path).replace("olist_", "").replace("_dataset", "").replace(".csv", "")
    if name == "geolocation":
        print("geolocation ignorée (1 million de lignes, inutile en semaine 1)")
        continue
    df = pd.read_csv(path)
    for col in df.columns:
        if "timestamp" in col or "date" in col:
            df[col] = pd.to_datetime(df[col], errors="coerce")
    df.to_sql(name, engine, if_exists="replace", index=False, chunksize=2000, method="multi")
    print(f"{name} : {len(df)} lignes chargées")