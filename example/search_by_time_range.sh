#!/bin/bash

START_TIME="2025-06-30T08:48:00"
END_TIME="2025-06-30T08:50:00"

./columnq sql --table alblog20250630.json "
SELECT
  timestamp
  , (CAST(request_processing_time AS FLOAT) + CAST(target_processing_time AS FLOAT) + CAST(response_processing_time AS FLOAT)) AS total_time
  , request_processing_time
  , target_processing_time
  , host
  , domain_name
  , uri
  , method
  , client
FROM alblog20250630
WHERE
  timestamp >= '$START_TIME' AND timestamp <= '$END_TIME'
  AND uri NOT LIKE '/api/star/cloudprnt'
  AND uri NOT LIKE '/images%'
  AND uri NOT LIKE '/build%'
  AND uri NOT LIKE '/favicon.ico'
  AND (uri LIKE '/manage/%' OR uri LIKE '/editor/%')
  AND method = 'POST'
ORDER BY timestamp ASC
"
