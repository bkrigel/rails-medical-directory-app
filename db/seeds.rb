# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
specialty1 = Specialty.create!(name: "Allergy and Immunology")
specialty2 = Specialty.create!(name: "Anesthesiology")
specialty3 = Specialty.create!(name: "Colon and Rectal Surgery")
specialty4 = Specialty.create!(name: "Dermatology")
specialty5 = Specialty.create!(name: "Emergency Medicine")
specialty6 = Specialty.create!(name: "Family Medicine")
specialty7 = Specialty.create!(name: "Internal Medicine")
specialty8 = Specialty.create!(name: "Medical Genetics and Genomics")
specialty9 = Specialty.create!(name: "Neurological Surgery")
specialty10 = Specialty.create!(name: "Neurology")
specialty11 = Specialty.create!(name: "Nuclear Medicine")
specialty12 = Specialty.create!(name: "Obstetrics and Gynecology")
specialty13 = Specialty.create!(name: "Ophthalmology")
specialty14 = Specialty.create!(name: "Orthopaedic Surgery")
specialty15 = Specialty.create!(name: "Otolaryngology")
specialty16 = Specialty.create!(name: "Pathology")
specialty17 = Specialty.create!(name: "Pediatrics")
specialty18 = Specialty.create!(name: "Physical Medicine & Rehabilitation")
specialty19 = Specialty.create!(name: "Plastic Surgery")
specialty20 = Specialty.create!(name: "Preventive Medicine")
specialty21 = Specialty.create!(name: "Psychiatry")
specialty22 = Specialty.create!(name: "Radiology")
specialty23 = Specialty.create!(name: "General Surgery")
specialty24 = Specialty.create!(name: "Thoracic Surgery")
specialty25 = Specialty.create!(name: "Urology")

doctor1 = Doctor.create!(first_name: "Stuart",
                         last_name: "Krigel",
                         location_city: "San Jose, CA",
                         years_in_practice: 29,
                         specialty_id: 21
                        )
doctor2 = Doctor.create!(first_name: "Dr.",
                         last_name: "Dre",
                         location_city: "Compton, CA",
                         years_in_practice: 30,
                         specialty_id: 10
                        )
doctor3 = Doctor.create!(first_name: "James",
                         last_name: "Doolittle",
                         location_city:
                         "Los Angeles, CA",
                         years_in_practice: 40,
                         specialty_id: 6
                        )
doctor4 = Doctor.create!(first_name: "Herbert",
                         last_name: "Jekyl",
                         location_city: "New York, NY",
                         years_in_practice: 14,
                         specialty_id: 23
                        )
doctor5 = Doctor.create!(first_name: "Alexander",
                         last_name: "Ellenberg",
                         location_city: "Stockton, CA",
                         years_in_practice: 44,
                         specialty_id: 19
                        )
doctor6 = Doctor.create!(first_name: "Brenda",
                         last_name: "Barrata",
                         location_city: "Rochester, NY",
                         years_in_practice: 29,
                         specialty_id: 21
                        )

patient1 = Patient.create!(first_name: "Bill",
                           last_name: "Burr"
                          )
patient2 = Patient.create!(first_name: "Christopher",
                           last_name: "Rock"
                          )
patient3 = Patient.create!(first_name: "David",
                           last_name: "Chappelle"
                          )
patient4 = Patient.create!(first_name: "Jim",
                           last_name: "Jefferies"
                          )
patient5 = Patient.create!(first_name: "Louis",
                           last_name: "C.K."
                          )
patient6 = Patient.create!(first_name: "Iliza",
                           last_name: "Schlesinger"
                          )
patient7 = Patient.create!(first_name: "Amy",
                           last_name: "Schumer"
                          )

ailment1 = Ailment.create!(description: "itchy scrotum",
                           length_in_days: 5,
                           patient_id: 1
                          )
ailment2 = Ailment.create!(description: "the itis",
                           length_in_days: 1,
                           patient_id: 2
                          )
ailment3 = Ailment.create!(description: "social anxiety",
                           length_in_days: 365,
                           patient_id: 3
                          )
ailment4 = Ailment.create!(description: "narcotics addiction",
                           length_in_days: 200,
                           patient_id: 4
                          )
ailment5 = Ailment.create!(description: "inflamed stomach",
                           length_in_days: 8,
                           patient_id: 5
                          )
ailment6 = Ailment.create!(description: "either measels or mumps",
                           length_in_days: 14,
                           patient_id: 6
                          )
ailment7 = Ailment.create!(description: "chicken pox",
                           length_in_days: 3,
                           patient_id: 7
                          )
ailment8 = Ailment.create!(description: "anger management issues",
                           length_in_days: 8000,
                           patient_id: 1
                          )
ailment9 = Ailment.create!(description: "alcoholism",
                           length_in_days: 10000,
                           resolved_status: true,
                           patient_id: 1
                          )

user1 = User.create!(role: doctor1,
                     email: "skrigel@doctor.com",
                     password: "doctors",
                     password_confirmation: "doctors"
                    )
user2 = User.create!(role: patient1,
                     email: "bburr@patient.com",
                     password: "redhead",
                     password_confirmation: "redhead"
                    )

prescription1 = Prescription.create!(drug: "Zoloft",
                                     dosage_in_milligrams: 15,
                                     doctor_id: 1,
                                     patient_id: 2
                                    )
prescription2 = Prescription.create!(drug: "Vyvanse",
                                     dosage_in_milligrams: 60,
                                     doctor_id: 2,
                                     patient_id: 3
                                    )
prescription3 = Prescription.create!(drug: "Adderall",
                                     dosage_in_milligrams: 20,
                                     doctor_id: 3,
                                     patient_id: 4
                                    )
prescription4 = Prescription.create!(drug: "Antibiotics of some sort",
                                     dosage_in_milligrams: 200,
                                     doctor_id: 4,
                                     patient_id: 5
                                    )
prescription5 = Prescription.create!(drug: "BBQ Ribs",
                                     dosage_in_milligrams: 12,
                                     doctor_id: 1,
                                     patient_id: 3
                                    )

appointment1 = Appointment.create!(scheduled_for: DateTime.strptime("09/14/2018 8:00", "%m/%d/%Y %H:%M"),
                                   duration_in_minutes: 50,
                                   doctor_id: 1,
                                   patient_id: 1
                                  )
appointment2 = Appointment.create!(scheduled_for: DateTime.strptime("10/14/2018 9:00", "%m/%d/%Y %H:%M"),
                                   duration_in_minutes: 50,
                                   doctor_id: 1,
                                   patient_id: 2
                                  )
appointment3 = Appointment.create!(scheduled_for: DateTime.strptime("07/01/2018 12:00", "%m/%d/%Y %H:%M"),
                                   duration_in_minutes: 120,
                                   doctor_id: 2,
                                   patient_id: 3
                                  )
appointment4 = Appointment.create!(scheduled_for: DateTime.strptime("12/25/2018 11:30", "%m/%d/%Y %H:%M"),
                                   duration_in_minutes: 60,
                                   doctor_id: 3,
                                   patient_id: 4
                                  )
appointment5 = Appointment.create!(scheduled_for: DateTime.strptime("09/22/2018 7:30", "%m/%d/%Y %H:%M"),
                                   duration_in_minutes: 120,
                                   doctor_id: 4,
                                   patient_id: 5
                                  )
appointment6 = Appointment.create!(scheduled_for: DateTime.strptime("09/23/2018 10:00", "%m/%d/%Y %H:%M"),
                                   duration_in_minutes: 60,
                                   doctor_id: 1,
                                   patient_id: 3
                                  )
