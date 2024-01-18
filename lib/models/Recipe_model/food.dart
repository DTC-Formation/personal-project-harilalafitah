import 'package:recipes_app/models/Recipe_model/categories_model.dart';

class Food {
  String name;
  String description;
  String image;
  String categories;
  int serves;
  int kcal;
  int totalTime;
  int prepTime;
  int cookTime;
  double rate;
  int reviews;
  bool isLiked;
  List ingredients;
  List instructions;

  Food({
    required this.name,
    required this.description,
    required this.image,
    required this.categories,
    required this.serves,
    required this.kcal,
    required this.totalTime,
    required this.prepTime,
    required this.cookTime,
    required this.rate,
    required this.reviews,
    required this.isLiked,
    required this.ingredients,
    required this.instructions,
  });

  void toggleLiked() {
    isLiked = !isLiked;
  }
}

final List<Food> foods = [
  Food(
    name: "Microwave Christmas mug cake",
    image: "assets/images/Microwave-Christmas-mug-cake.jpg",
    kcal: 635,
    totalTime: 7,
    rate: 1,
    reviews: 1,
    isLiked: false,
    description:
        "Make a large cake using a 600ml mug or halve the mixture to make one small cake instead of two. Enjoy with brandy butter or custard.",
    categories: categories[4],
    serves: 2,
    prepTime: 5,
    cookTime: 3,
    ingredients: [
      '50g butter',
      '½ tbsp brandy',
      '25g raisins',
      '25g sultanas',
      '25g mixed peel',
      '4 glacé or dried cherries, chopped',
      '50g self-raising flour',
      '1 egg',
      '25g ground almonds',
      '¼ tsp ground cinnamon or mixed spice',
      '50g soft light brown sugar',
      'brandy butter or custard, to serve',
    ],
    instructions: [
      'STEP 1:\n  Melt the butter in a 300ml mug in the microwave for 20-30 seconds on high.\n Tip in the brandy, raisins, sultanas, mixed peel and glacé cherries and heat for a further 45 seconds.\n Remove from the microwave and tip into a jug or bowl. Set aside.',
      'STEP 2:\n  Leave some of the remaining butter in the mug and use the rest to butter a second 300ml mug.\n If you want to turn out the cakes at the end, line the mugs with baking parchment.\n It’s easiest to put a piece in the base of each mug, then another around the inside wall. You will get neater edges if you cover the inside fully.',
      'STEP 3:\n  Add the remaining ingredients to the soaked fruit, mix to combine, then divide between the two mugs.\n Cook for 1 min 30 seconds until puffed up but not dry, then leave to stand for 2 mins.\n Eat out of the mug or turn out onto a plate.\n Serve warm with a spoonful of brandy butter or plenty of custard.'
    ],
  ),
  Food(
    name: "Microwave mug cake",
    description:
        "Need a quick chocolate fix? Try making this easy microwave mug cake with storecupboard ingredients. It's even more delicious with a scoop of vanilla ice cream.",
    image: "assets/images/mug-cake.jpg",
    categories: categories[4],
    serves: 1,
    kcal: 1117,
    totalTime: 7,
    prepTime: 5,
    cookTime: 2,
    rate: 4,
    reviews: 440,
    isLiked: false,
    ingredients: [
      "4 tbsp self-raising flour",
      "4 tbsp caster sugar",
      "2 tbsp cocoa powder",
      "1 medium egg",
      "3 tbsp milk",
      "3 tbsp vegetable oil or sunflower oil",
      "a few drops of vanilla essence or other essence (orange or peppermint work well)",
      "2 tbsp chocolate chips, nuts, or raisins etc (optional)], instructions: instructions)",
    ],
    instructions: [
      "STEP 1:\n Add 4 tbsp self-raising flour, 4 tbsp caster sugar and 2 tbsp cocoa powder to the largest mug you have (to stop it overflowing in the microwave) and mix.",
      "STEP 2:\n Add 1 medium egg and mix in as much as you can, but don't worry if there's still dry mix left.",
      "STEP 3:\n Add the 3 tbsp milk, 3 tbsp vegetable or sunflower oil and a few drops of vanilla essence and mix until smooth, before adding 2 tbsp chocolate chips, nuts, or raisins, if using, and mix again.",
      "STEP 4:\n Centre your mug in the middle of the microwave oven and cook on High for 1½ -2 mins, or until it has stopped rising and is firm to the touch.",
    ],
  ),
  Food(
    name: "Crispy shredded chicken",
    image: "assets/images/Crispy-shredded-chicken.jpg",
    kcal: 506,
    totalTime: 30,
    rate: 4,
    reviews: 4,
    isLiked: false,
    description:
        'Try this takeaway favourite served with rice, or simply on its own as part of a buffet-style meal. It can work as a main course or starter to share.',
    categories: categories[3],
    serves: 4,
    prepTime: 10,
    cookTime: 20,
    ingredients: [
      '320g pack chicken mini breast fillets'
          '2½ tbsp light soy sauce',
      'vegetable oil, for frying',
      '1 red pepper, deseeded and thinly sliced',
      '1 green pepper, deseeded and thinly sliced',
      '3 tbsp cornflour',
      '3 tbsp sweet chilli sauce',
      '1 tbsp garlic and ginger paste',
      '1 tbsp sesame oil',
      '2 spring onions, trimmed and finely sliced',
    ],
    instructions: [
      'STEP 1:\n  Slice the chicken into thin strips. Pour over 2 tbsp of the soy and marinate in the fridge, covered, for 1 hr.',
      'STEP 2:\n  Meanwhile, heat 1 tbsp of the oil in a wok or deep frying pan over a medium heat and cook the peppers for 3-4 mins until just beginning to soften. Remove with a slotted spoon and set aside.',
      'STEP 3:\n  Spread the cornflour out in a shallow bowl. Season, then add the marinated chicken strips and toss to coat well.',
      'STEP 4:\n  Fill a wok or deep frying pan with the oil so it’s about ½cm deep, then heat to medium-high. Carefully add the chicken in batches, cooking for 3-4 mins, using tongs to turn regularly until golden and crispy. Remove with a slotted spoon and place on a plate lined with kitchen paper to drain.',
      'STEP 5:\n  Mix together the remaining soy, sweet chilli, garlic paste and sesame oil in a large bowl. Add the cooked peppers, crispy chicken and toss together until coated all over and sticky. Serve sprinkled with the spring onions.',
    ],
  ),
  Food(
    name: "Mexican-style stuffed peppers",
    image: "assets/images/mexican-style-stuffed-peppers.jpg",
    kcal: 468,
    totalTime: 35,
    rate: 4,
    reviews: 30,
    isLiked: false,
    description:
        "Stuff peppers with rice and black beans, then top with chilli cheese and fresh guacamole for an easy vegetarian family meal. If the kids don't like spice, use a mild cheese instead.",
    categories: categories[2],
    serves: 2,
    prepTime: 15,
    cookTime: 35,
    ingredients: [
      '3 large mixed peppers, halved',
      'oil, for drizzling',
      '2 x 250g pouches lime & coriander rice, cooked',
      '400g can black beans, drained and rinsed',
      '6 Mexican-style chilli cheese slices (use regular cheddar or monterey jack, if you like)',
      '150g fresh guacamole',
    ],
    instructions: [
      'STEP 1:\n Heat the oven to 220C/200C fan/gas 7 or preheat the air fryer to 180C for 4 mins.',
      'STEP 2:\n Remove the seeds and any white pith from the peppers and arrange them, cut-side up, in a roasting tin for the oven or in the air fryer basket for the air fryer. In both cases, brush the peppers with oil and season them.',
      'STEP 3:\n If using the oven, bake the peppers for 20 mins. If using the air-fryer, cook the peppers in a single layer for 8-10 mins until they are softened and starting to caramelise.',
      'STEP 4:\n Combine the rice and beans.',
      'STEP 5:\n For the oven method, remove the peppers from the oven and fill them with the rice mixture. Top each with a slice of cheese and bake for an additional 10-15 mins, until the cheese has melted, and the filling is hot.',
      'STEP 6:\n For the air-fryer method, remove the peppers from the air-fryer and fill them with the rice mixture. Top each with a slice of cheese and air-fry for 3 mins more, until the cheese has melted and the filling is hot.',
      'STEP 7:\n Top the stuffed peppers with spoonfuls of guacamole.',
    ],
  ),
  Food(
    name: "Salmon & asparagus one-pot gratin",
    image: "assets/images/Salmon-and-asparagus-gratin.jpg",
    kcal: 921,
    totalTime: 35,
    rate: 4,
    reviews: 6,
    isLiked: false,
    description:
        "Make the most of asparagus in season in early British summertime with this delicious creamy salmon and asparagus one-pot topped with crunchy breadcrumbs.",
    categories: categories[2],
    serves: 4,
    prepTime: 10,
    cookTime: 25,
    ingredients: [
      '30g dried breadcrumbs',
      '2 sprigs parsley, leaves picked and chopped',
      '100g parmesan',
      '1 tsp olive oil',
      "25g unsalted butter",
      '1 red onion, finely chopped',
      '1 garlic clove, crushed or finely grated',
      '300ml double cream',
      '100ml milk',
      '500g asparagus, trimmed and halved',
      '4 skinless salmon fillets',
    ],
    instructions: [
      "STEP 1:\n  Heat the oven to 200C/180C fan/gas 6. Combine the breadcrumbs, parsley and 25g parmesan, then set aside. Heat the oil and butter in a large flameproof casserole over a medium heat and fry the onion for 5 mins until starting to soften. Stir in the garlic, and cook for 1-2 mins more to soften slightly, then stir in the cream, milk and remaining parmesan. Bring to a simmer and cook until the cheese has melted, then season well, stir and remove from the heat.",
      "STEP 2:\n  Tip in the asparagus and ensure it is submerged in the sauce. Nestle in the salmon fillets, skin-side down. Scatter the cheesy breadcrumb mixture over the salmon fillets, then transfer to the oven and bake for 14-16 mins until the salmon is cooked through and the breadcrumb topping is lightly golden.",
    ],
  ),
];
