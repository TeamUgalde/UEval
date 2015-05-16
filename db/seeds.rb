# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Load some universities
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
