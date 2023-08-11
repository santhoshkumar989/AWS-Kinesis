const AWS = require('aws-sdk');
const kinesis = new AWS.Kinesis();

exports.handler = async (event) => {
  const s3Object = event.Records[0].s3;
  const bucket = s3Object.bucket.name;
  const key = s3Object.object.key;
  
  const data = await getObjectDataFromS3(bucket, key);
  
  const params = {
    Data: data,
    PartitionKey: key,
    StreamName: 'my-kinesis-stream'
  };
  
  await kinesis.putRecord(params).promise();
  
  return 'Data ingested to Kinesis';
};

async function getObjectDataFromS3(bucket, key) {
  const s3 = new AWS.S3();
  const response = await s3.getObject({ Bucket: bucket, Key: key }).promise();
  return response.Body.toString();
}
