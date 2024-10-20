·
Register a free AWS account, the interview task will fit into the 12 month free tier.
Create either a GitHub repository or an AWS CodeCommit repository holding your code.
Automatize the resource creation steps with Terraform or CloudFormation and store it in GIT
·
Create a Container Registry to hold container image
·
Create an S3 bucket, which is public to the internet, and capable of static web hosting Create a HelloWorld style static HTML website and store it in GIT
Create a PostgreSQL RDS instance
o Connection credentials should be stored in SSM ParameterStore Create a Python application which connects to the RDS instance and print out:
o Connection properties
o RDS version
o Credentials should be retrieved from SSM ParameterStore
Create a Dockerfile into GIT which contains the Python application and set as a starting point
· Create a CI pipeline with the following tasks:
o Create an EC2, and install Jenkins on it or use AWS CodePipeline
o Create a source step which clones the given GIT repository
о Create a build step which build a Docker container and upload it to the Registry
о
Create a deploy step which uploads a static html to the S3 bucket Give READ access to the GIT repository and to the created resources.
