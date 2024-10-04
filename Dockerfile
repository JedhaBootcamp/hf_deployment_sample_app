FROM continuumio/miniconda3

RUN apt-get update
RUN apt-get install nano unzip
RUN apt install curl -y 

RUN pip install boto3 pandas gunicorn streamlit scikit-learn matplotlib seaborn plotly
COPY . /home/app

RUN useradd -m -u 1000 user
USER user
ENV HOME=/home \
	PATH=/home/.local/bin:$PATH

WORKDIR $HOME/app

COPY --chown=user . $HOME/app

CMD streamlit run --server.port $PORT app.py