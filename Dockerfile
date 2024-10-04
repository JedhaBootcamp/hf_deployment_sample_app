FROM continuumio/miniconda3

WORKDIR /home/app

RUN apt-get update
RUN apt-get install nano unzip
RUN apt install curl -y 

RUN curl -fsSL https://get.deta.dev/cli.sh | sh
RUN pip install boto3 pandas gunicorn streamlit scikit-learn matplotlib seaborn plotly
COPY . /home/app

RUN useradd -m -u 1000 user
USER user

CMD streamlit run --server.port $PORT app.py