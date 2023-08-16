import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pravidla"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    """Modrý život""",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    """Co je cílem?""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      """Zbavit se závislosti na pornu a navazujících problémů s rychlým dopaminem.""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Proč?""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      """Abys tohle nemusel řešit až budeš hrotit vysokou -  získal více času, sebekontrolu, produktivitu.""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Jak na to?""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      """Pomocí plnění téhle půlroční výzvy. Ta je sestavená tak, aby podporovala zvyky, které snižují potřebu porna a prokrastinace.""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Pravidla a systém výzvy:""",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                      """Po celou dobu výzvy se snažíš si udržet úspěšný týden. Čtyři úspěšné týdny znamenají úspěšný měsíc.""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Úspěšný týden""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      """Týden je považován za úspěšný, pokud zvládneš NN supermisi a k tomu splníš ještě alespoň další dvě mise z různých okruhů.""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """NN supermise""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text("""Mise nadřazená všem ostatním. Má progres v čase:
1.-2. měsíc výzvy	5 dní bez porna/týden
3.-4. měsíc výzvy	6 dní bez porna/týden
5.-6. měsíc výzvy	7 dní bez porna/týden
""", style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Úspěšný měsíc""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      """Měsíc je považován za úspěšný, pokud jsi v něm měl 4 úspěšné týdny. Za každý úspěšný měsíc je speciální odměna.""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Okruhy a mise""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      """Okruhy jsou postavené tak, aby jejich plnění podporovalo zvyky a činnosti snižující potřebu porna a prokrastinace a zároveň Tě motivovaly tyhle věci sám regulovat. Ideálem je snaha plnit mise v kategorii a.
Plněním misí neděláš dobře jenom téhle výzvě, ale i sám sobě. Veškeré Tvé úspěchy se načítají do counterů, které Ti odemykají mňamózní odměny.
""",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    """Pozn.:""",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(""" - sledování porna se počítá jako prokrastinace
 - sex se počítá jako fyzická aktivita
""", style: Theme.of(context).textTheme.bodyMedium),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Okruhy",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mise A",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mise B",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mise C",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Sex",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "1 sex/den 3x v týdnu",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "∑ 5",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "-",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No porn",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "celý týden bez P",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "-",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "-",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Fyzická aktivita",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "1,5 h/den 6x v týdnu",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "∑ 14 h",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "-",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No prokrastinace",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "max 1h/den",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "max 6h/týden",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "75% prokra. vyváženo rozumnou činností",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Spánek",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "min 8h 5x v týdnu",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ø za týden 8h",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "min 3 fakt dobrý rána",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
