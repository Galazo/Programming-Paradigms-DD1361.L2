Programming-Paradigms-DD1361-L2
===============================

Labb L2: Konspirationsdetektion Problem-ID på Kattis: kth:progp:l2
Foliehattarnas Riksförbund har beställt en programvara för att söka efter möjliga konspirationer i sociala nätverk. Ett socialt nätverk i den här uppgiften består av en uppsättning personer, och information om vilka par av personer som är bekanta med varandra.
1 Bakgrund
En konspiration består av ett flertal personer: en mängd konspiratörer samt en spindel i nätet, med följande egenskaper:
• Spindeln i nätet är bekant med alla konspiratörer (men kanske även andra personer som inte är konspiratörer).
• Ingen av konspiratörerna är bekant med någon annan konspiratör (eftersom detta skulle dra miss- tanke till sig).
• Alla personer som inte redan är konspiratörer eller spindeln i nätet känner någon av konspiratö- rerna (så att konspirationen har inflytande över hela nätverket).

Databas

Det sociala nätverket du ska söka i kommer vara definierat via följande två predikat.
person(?X) är sant om X är en person (så “person(X).” kan användas för att lista alla personer i databasen).
knows(?X, ?Y) är sant om X och Y är bekanta. Observera att vi i den här uppgiften betraktar be- kantskapsrelationen som symmetrisk – om X är bekant med Y så är Y bekant med X – men i den Prolog-databas som ditt program kommer arbeta med kommer bara en av de två ordningarna vara definierad.
Exempeldata och testning

Till er hjälp finns en uppsättning test-databaser att ladda hem som ni kan provköra med: l2_examples.zip. I den första databasen “example1.pl” finns även tips på hur man kan göra för att provköra samt hur
man använder trace.

2 Uppgift
1. Skriv ett predikat spider(?X) som är sant om X kan vara spindeln i nätet i en konspiration. När predikatet anropas med en okänd ska det generera varje möjlig spindel i nätet. Det spelar ingen roll i vilken ordning de genereras, men samma person ska inte genereras flera gånger (se exempel-databasen “example2.pl”).

2. Konstruera en egen exempel-databas för problemet där ert program tar ohemult lång tid på sig (säg, mer än 10 sekunder). Ert exempel får inte vara för stort – högst 100 personer, och ju mindre desto bättre.
Redovisning
Vid redovisning ska ni (förutom att visa upp godkänd Kattis-lösning):
progp 2014: Labb L2: Konspirationsdetektion 17
• Visa er egenkonstruerade testdatabas som tar lång tid för ert program att lösa.
• Kunna förklara hur sökningen efter lösningar fungerar i ert program (t.ex. på er egenkonstruerade
databas), med hjälp av trace.

3 Vägledning
En bra början är att skriva predikat för de olika del-egenskaperna vi är intresserade av, t.ex.:
• Ett predikat som givet en lista med personer avgör om ingen av personerna känner varandra
• Ett predikat som givet en lista med personer kollar om det finns någon utanför listan som inte känner någon i listan.
• Etc

Givet dessa kan en första lösning på problemet ha följande struktur, enligt “generate-and-test”-metoden.

1. Låt s vara en person och K en lista med (andra) personer.

2. Testa om K kan vara konspiratörerna med s som spindeln i nätet.

Utöver predikaten för att verifiera de önskade egenskaperna behöver du alltså skriva ett predikat som ge- nererar alla möjliga delmängder av personer, ungefär på samma sätt som vi i exemplet från föreläsningen med permutations-sortering har ett predikat som genererar alla permutationer av en lista.
Du kan skicka in denna lösning till Kattis för att se hur långt den klarar sig. Du borde då klara ca hälften av testfallen i Kattis (och sedan få Time Limit Exceeded), om du inte gör det så är det antagligen något som du gjort konstigt som vore värt att fixa innan du går vidare med en mer komplicerad lösning.
Hur ska vi ändra lösningen så att den blir snabbare? Istället för att generera hela listan K och sedan testa om den uppfyller villkoren för att vara konspiratörerna kan man ju kolla vissa av villkoren medans listan genereras. Om t.ex. Anna och Kalle känner varandra, och vi börjar generera en lista K som innehåller både Anna och Kalle så kommer den aldrig kunna utökas till en lösning och den aktuella delen av sökningen kan brytas.
För att få din lösning tillräckligt snabb kommer du att behöva förstå hur Prolog letar efter en lösning. Prologs trace-verktyg är mycket användbart för detta – om du inte redan använde det till labb L1 så ska du använda det nu. Den första exempel-databasen har lite instruktioner för hur man kan använda trace.
progp 2014: Labb L2: Konspirationsdetektion 18
