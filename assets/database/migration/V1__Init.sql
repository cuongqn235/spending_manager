CREATE TABLE IF NOT EXISTS image_file (
      id TEXT NOT NULL PRIMARY KEY, 
      userId TEXT NOT NULL, 
      folder TEXT NOT NULL, 
      fileName TEXT NOT NULL, 
      isPublic INTEGER NOT NULL, 
      isUploaded INTEGER NOT NULL, 
      localUrl TEXT, 
      downloadUrl TEXT, 
      dataType TEXT NOT NULL, 
      isLocalFile INTEGER NOT NULL, 
      dataGroup TEXT NOT NULL, 
      dataSubGroup TEXT NOT NULL, 
      createdAt TEXT 
      );    