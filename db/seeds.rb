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

=end
