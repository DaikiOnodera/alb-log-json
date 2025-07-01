#!/bin/bash

./columnq sql --table alblog20250630.json "
SELECT
  timestamp
  , (CAST(request_processing_time AS FLOAT) + CAST(target_processing_time AS FLOAT) + CAST(response_processing_time AS FLOAT)) AS total_time
  , request_processing_time
  , target_processing_time
  , response_processing_time
  , host
  , domain_name
  , uri
  , method
  , client
FROM alblog20250630
WHERE
  client like '60.103.70.253%'
ORDER BY timestamp ASC
"
