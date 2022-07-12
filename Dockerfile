# the image on the basis of which we create a container
FROM python:3.6-slim
# environment variables for python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# installing dependencies
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip
COPY app/requirements.txt /code/

RUN pip install -r requirements.txt
# copy the contents of the current folder to the container
COPY ./app/ /code/

EXPOSE 8000
# run commands
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
