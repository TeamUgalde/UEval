# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Load some universities

=begin
universities = University.create([
                                     {name: 'Instituto Tecnológico de Costa Rica',
                                      webpage: 'http://www.tec.ac.cr/',
                                      banner: 'itcr.png'},
                                     {name: 'Universidad de Costa Rica',
                                      webpage: 'http://www.ucr.ac.cr/',
                                      banner: 'ucr.png'},
                                     {name: 'Universidad Técnica Nacional',
                                      webpage: 'http://www.utn.ac.cr/',
                                      banner: 'utn.jpg'},
                                     {name: 'Universidad Nacional',
                                      webpage: 'http://www.una.ac.cr/',
                                      banner: 'una.jpg'},
                                     {name: 'Universidad Estatal a Distancia',
                                      webpage: 'http://www.uned.ac.cr/',
                                      banner: 'uned.png'},
                                 ])

#Load schools.
schools = School.create([
                                     {name: 'Ingeniería en Computación',
                                      university_id: 1},
                                     {name: 'Matemática',
                                      university_id: 1},
                                     {name: 'Ingeniería en Electrónica',
                                      university_id: 1},
                                     {name: 'Física',
                                      university_id: 1},
                                     {name: 'Administración de empresas',
                                      university_id: 1},
                                     {name: 'Ingeniería Forestal',
                                      university_id: 1},
                                     {name: 'Cultura y Deporte',
                                      university_id: 1},
                                     {name: 'Química',
                                      university_id: 1},
                                     {name: 'Biología',
                                      university_id: 1},
                                     {name: 'Agronegocios',
                                      university_id: 1},
                                     {name: 'Ciencia e Ingeniería de los materiales',
                                      university_id: 1},
                                     {name: 'Ciencias del lenguaje',
                                      university_id: 1},
                                     {name: 'Ciencias Sociales',
                                      university_id: 1},
                                     {name: 'Educación Técnica',
                                      university_id: 1},
                                     {name: 'Ingeniería Agrícola',
                                      university_id: 1},
                                     {name: 'Ingeniería Electromecánica',
                                      university_id: 1},
                                     {name: 'Ingeniería en Construcción',
                                      university_id: 1},
                                     {name: 'Derecho',
                                      university_id: 2}
                                 ])


courses = Course.create([
                         {name: 'Estructura de Datos', overall_difficulty: 7,
                         school_id: 1, state: 'accepted'},
                         {name: 'Programacion Orientada a Objetos', overall_difficulty: 6,
                         school_id: 1, state: 'accepted'},
                         {name: 'Analisis de Algoritmos', overall_difficulty: 8,
                         school_id: 1, state: 'accepted'},
                         {name: 'Lenguajes de Programacion', overall_difficulty: 8,
                         school_id: 1, state: 'accepted'},
                         {name: 'Redes', overall_difficulty: 9,
                         school_id: 1, state: 'accepted'},
                         {name: 'Administracion de Proyectos', overall_difficulty: 2,
                         school_id: 1, state: 'accepted'},
                         {name: 'Inteligencia Artificial', overall_difficulty: 9,
                         school_id: 1, state: 'accepted'},
                         {name: 'Introduccion a la Programacion', overall_difficulty: 4,
                         school_id: 1, state: 'accepted'},
                         {name: 'Taller de Programacion', overall_difficulty: 5,
                         school_id: 1, state: 'accepted'},
                         ])
                         
=end

professors = Professor.create([
                         {name: 'Eddy', last_name: 'Ramirez', overall_score: 6,
                         school_id: 1, state: 'accepted'},
                         {name: 'Carlos', last_name: 'Arias', overall_score: 10,
                         school_id: 1, state: 'accepted'},
                         {name: 'Jaime', last_name: 'Gutierrez', overall_score: 7,
                         school_id: 1, state: 'accepted'},
                         {name: 'Diego', last_name: 'Munguia', overall_score: 8,
                         school_id: 1, state: 'accepted'},
                         {name: 'Mauricio', last_name: 'Aviles', overall_score: 3,
                         school_id: 1, state: 'accepted'},
                         {name: 'Kevin', last_name: 'Moraga', overall_score: 5,
                         school_id: 1, state: 'accepted'},
                         {name: 'Erick', last_name: 'Hernandez', overall_score: 9,
                         school_id: 1, state: 'accepted'},
                         ])