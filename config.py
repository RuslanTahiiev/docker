class Config:

    # Flask
    FLASK_APP = 'wsgi.py'
    FLASK_ENV = 'development'
    TESTING = True
    DEBUG = True
    SECRET_KEY = 'overpoweredsecretkey'

    # SQLAlchemy
    SQLALCHEMY_DATABASE_URI = 'postgresql://flask_user:password@localhost:5431/database'
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # Static Assets
    STATIC_FOLDER = 'static'
    TEMPLATES_FOLDER = 'templates'
