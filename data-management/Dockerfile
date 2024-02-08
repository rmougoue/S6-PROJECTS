FROM postgres

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    python3-pip \
    groff \
    less \
    docker \
    docker-compose \
    git \
    vim \
    awscli
#Install AWS CLI V2
# RUN apt-get update \
    # && apt-get install -y awscli
#set the working directory
WORKDIR /s6rene-backup
COPY . .
#make the script executable
RUN chmod +x backup.sh

#Set the entrypoint
ENTRYPOINT [ "./backup.sh" ]


# Database credentials
ENV DB_USER=''
ENV DB_PASSWORD='' 
ENV DB_NAME='s6-user'
ENV DB_HOST=''  
ENV DB_PORT=''
# Backup directory
ENV BACKUP_DIR='/s6rene-backup'

# AWS S3 bucket
ENV S3_BUCKET='s3://del-db-backup/S6/s6rene/'

# Set AWS credentials and default region
ENV AWS_ACCESS_KEY_ID=
ENV AWS_SECRET_ACCESS_KEY=
ENV AWS_DEFAULT_REGION=us-east-1

# Optionally, you can run aws configure here if needed
# RUN aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && \
#     aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && \
#     aws configure set default_region $AWS_DEFAULT_REGION
