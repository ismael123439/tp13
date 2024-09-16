from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

username = 'ude5ew8s9zf8o1bw'
password = 'kmdYEIy3t9FRuIXWOZ8M'
hostname = 'bympkas0qk7r7auydfha-mysql.services.clever-cloud.com'
database = 'bympkas0qk7r7auydfha'

app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+mysqlconnector://{username}:{password}@{hostname}/{database}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Configuración de la base de datos
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///mi_base_de_datos.db'
db = SQLAlchemy(app)

# Definir tus modelos aquí, por ejemplo:
class Equipo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100))
    puntuacion = db.Column(db.Integer)

# Crear las tablas
with app.app_context():
    db.create_all()

# Ejecutar consultas en tus rutas Flask
@app.route('/equipos')
def listar_equipos():
    equipos = Equipo.query.all()
    return {"equipos": [equipo.nombre for equipo in equipos]}

if __name__ == '__main__':
    app.run(debug=True)
