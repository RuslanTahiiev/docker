from . import db


class Addons:
    def add_obj(self):
        try:
            db.session.add(self)
            db.session.commit()
            return True
        except Exception as e:
            print(e)
            return False


class MyModel(db.Model, Addons):

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)

    def __init__(self, title):
        self.title = title

    def __repr__(self):
        return '<MyModel %r>' % self.id
