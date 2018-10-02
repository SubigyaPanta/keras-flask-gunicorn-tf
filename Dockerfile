FROM python:3.6

ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
RUN apt-get update \
    && apt-get install -y cmake \
    && apt-get -y install python3-dev python3-pip build-essential python3-tk \
    && apt-get install -y libsm6 libxext6 libxrender-dev 

# Server
RUN pip install \
        gunicorn==19.9.0 \
        gevent==1.3.6 \
        Flask==1.0.2 \
        Flask-json-schema==0.0.5 \
        requests==2.18.4 \
        urllib3==1.22 \

        # Scientific libs in order to be installed
        numpy==1.14.5 \
        pandas==0.23.4 \
        scipy==1.1.0 \
        matplotlib==2.1.1 \
        statsmodels==0.9.0 \
        seaborn==0.9.0 \
        scikit-learn==0.19.2 \

        # DeepLearning tools
        tensorflow==1.10.0 \
        tensorboard==1.10.0 \
        Keras==2.2.2 \

        # Validation
        strict-rfc3339==0.7 \
        jsonschema==2.6.0 \

        # Encrypt decrypt
        boto3==1.9.7 \

        # Database
        mysqlclient==1.3.13
