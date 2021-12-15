from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def init_app():
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_object('config.Config')

    # Init plugins
    db.init_app(app)

    with app.app_context():
        from . import routes

        # Database
        db.create_all()

        return app