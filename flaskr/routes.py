from flask import current_app as app
from flask import jsonify
from .utils import get_hit_count
from .models import MyModel


@app.route('/')
def index():
    count: int = get_hit_count()
    context = {
        'title': f'Hi! Counts: {count}',
    }
    return jsonify(context)


@app.route('/get/<title>')
def get_index(title):

    obj = MyModel.query.filter_by(title=title).first()

    context = {
        'title': obj.title,
    }
    return jsonify(context)


@app.route('/add/<title>')
def add_index(title):
    obj = MyModel(title=title)
    obj.add_obj()
    return jsonify(obj.title)

