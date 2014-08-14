puts '******************************************************'
puts 'BEGIN SEEDING DATABASE WITH DEMO DATA'
puts '******************************************************'

addresses = Address.create([
	{street:'123 Fascination St',addressable_id: 1,addressable_type:'ResidenceLocation'}
])

residence_locations = ResidenceLocation.create([{}])
on_premises_locations = OnPremisesLocation.create([
	{area:'Dog Healthy Holding',unit:'1'},
	{area:'Dog Healthy Holding',unit:'2'},
	{area:'Dog Healthy Holding',unit:'3'},
	{area:'Dog Healthy Holding',unit:'4'},
	{area:'Dog Healthy Holding',unit:'5'},
	{area:'Dog Healthy Holding',unit:'6'},
	{area:'Dog Healthy Holding',unit:'7'},
	{area:'Dog Healthy Holding',unit:'8'},
	{area:'Dog Healthy Holding',unit:'9'},
	{area:'Dog Healthy Holding',unit:'10'},
	{area:'Cat Healthy Holding',unit:'1'},
	{area:'Cat Healthy Holding',unit:'2'},
	{area:'Cat Healthy Holding',unit:'3'},
	{area:'Dog Quarentine',unit:'1'},
	{area:'Cat Quarentine',unit:'2'}])

animals = Animal.create([
  {name:'Jasper',location_id:1,animal_status_id:1,animal_type_id:1,code:1111},
  {name:'Guinness',location_id:2,animal_status_id:3,animal_type_id:1,code:1111},
  {name:'Gizmo',location_id:2,animal_sex_id:1,animal_status_id:3,animal_type_id:1,code:1111,remote_picture_url:'http://res.cloudinary.com/hwtphffjr/image/upload/t_media_lib_thumb/v1403932823/dwg9kpfduoltqcm1ni3w.jpg'},
  {name:'Jesse',location_id:15,animal_status_id:3,animal_type_id:1,code:1111,remote_picture_url:'http://res.cloudinary.com/hwtphffjr/image/upload/t_media_lib_thumb/v1406096720/cp8wdzfoluodl087dg9a.jpg'},
  {name:'Pip',location_id:3,animal_status_id:3,animal_type_id:1,code:1111,remote_picture_url:'http://res.cloudinary.com/hwtphffjr/image/upload/t_media_lib_thumb/v1403918766/nybuvyrogb64kaaffeuh.jpg'},
  {name:'Dakota',location_id:4,animal_status_id:3,animal_type_id:1,code:1111,remote_picture_url:'http://res.cloudinary.com/hwtphffjr/image/upload/c_thumb,g_face,h_100,w_150/v1406106211/bosjx0zaqytt9w6kd0mq.jpg'},
  {name:'Edgar',location_id:5,animal_status_id:2,animal_type_id:1,code:1111},
  {name:'Muffin',location_id:6,animal_status_id:2,animal_type_id:1,code:1111},
  {name:'Zippy',location_id:7,animal_status_id:2,animal_type_id:1,code:1111},
  {name:'Charlie',location_id:8,animal_status_id:2,animal_type_id:1,code:1111},
  {name:'Marshmellow',location_id:9,animal_status_id:2,animal_type_id:1,code:1111},
  {name:'Blue',location_id:10,animal_status_id:2,animal_type_id:1,code:1111}
])

users = User.create([
  {email:'demo@demo.com',password:'demo',password_confirmation:'demo'}
])

Animal.find(1).create_activity :create, owner: User.find(1)
Animal.find(2).create_activity :create, owner: User.find(1)
Animal.find(3).create_activity :create, owner: User.find(1)
Animal.find(4).create_activity :create, owner: User.find(1)
Animal.find(5).create_activity :create, owner: User.find(1)
Animal.find(6).create_activity :create, owner: User.find(1)
Animal.find(7).create_activity :create, owner: User.find(1)
Animal.find(8).create_activity :create, owner: User.find(1)
Animal.find(9).create_activity :create, owner: User.find(1)
Animal.find(10).create_activity :create, owner: User.find(1)
Animal.find(11).create_activity :create, owner: User.find(1)
Animal.find(12).create_activity :create, owner: User.find(1)


puts '******************************************************'
puts 'END SEEDING DATABASE'
puts 'Animal was created? ' + Animal.find(1).name
puts 'Animal types were created?' + AnimalType.find(1).name
puts '******************************************************'