use strict;
use warnings;
use feature ":5.10";
# global variables
my @words = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment"
,"classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire"
,"ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement"
,"support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance"
,"distance","nature","history","organization","international","championship","government","popularity"
,"thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority"
,"physics","branche","science","mathematics","lightning","dispersion","accelerator","detector"
,"terminology","design","operation","foundation","application","prediction","reference","measurement","concept"
,"perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration"
,"classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay"
,"production","release","emphasis","director","trademark","vehicle","aircraft","experiment");
my @slots;
my $guessed;
my $Takentries;
my $playagain='y';
my $rem;
      my %seen = ();
        my @uniq;
&main(); # call the main method

sub main {
        while($playagain eq 'y')
        { @slots = ();
     $guessed = 0;
    $Takentries = 0;
     %seen = ();
        my @uniq;
        my $word = @words [int(rand($#words-1)) - 1];# choose a random word
        my $size = length($word);
        print"The word is: " . $word . "\n";
        for (my $i=0; $i < $size; $i++) {
                $slots [$i] = '_';
        }
        while ($guessed eq 0) {
                        &HangmanState();
                print join(" ", @slots);
                print "\n\nGuess a letter: ";
            
            my $guess = readline();
                chomp($guess); # remove newline
                $guess = lc($guess);#Converts uppercase
                push(@uniq, $guess) unless $seen{$guess}++;
                print "Guesses so far : ";
                print join(", ", @uniq);
                print "\n";
                &Checkguess($word, $guess);
                $guessed = &Checkwin($word);
                $rem = 6 - $Takentries;
                print "You have $rem body parts remaining". "\n";

                $guessed = &Checkwin($word);
            

        }

    print join(" ", @slots);
    
   print "\n\nCongrats!,You guessed the word!\n";
    print "Do you want to play again?(y/n)\n";
    $playagain=<>;
    chomp($playagain);
  
}
}

sub Checkguess {
    my ($word, $guess) = @_;
    my $letterIndex = index($word, $guess);
    my $flag = -1;
    if ($letterIndex eq -1) {
        print "Oops try again!\n";
        $Takentries++;
    } else {

        for (my $i=0; $i < length($word); $i++) {
            my $c_letter = substr($word, $i, 1);
            if ($guess eq $slots[$i]) {
               
               if($flag eq 0){last;}
               print ("Already guessed,try again!\n");
                    $flag = 0;
                     next;
            }
            if ($guess eq $c_letter) {
              
                $slots [$i] = $c_letter;
                $flag=1;
                }
                
        }
        if($flag eq 1){print "Correct guess,keep it up!\n"};
    }
}

sub Checkwin {
    my ($word) = @_;
    my $letter;
    for (my $i=0; $i< length($word); $i++) {
        $letter = substr($word, $i, 1);
        if ($letter ne $slots [$i]) {
            return 0;
        }
    }
    return 1;
}
sub HangmanState1
{
        print " _________\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub HangmanState2
{
        print " _________\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub HangmanState3
{
        print " _________\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub HangmanState4
{
        print " _________\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub HangmanState5
{
        print " _________\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub HangmanState6
{
        print " _________\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |     /\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}
sub HangmanState7
{
        print "  _________\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |    /\\\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    print "You lost!\n";
   
}

 sub HangmanState() {
    given($Takentries) {
        when(0) {&HangmanState1();}
        when(1) {&HangmanState2();}
        when(2) {&HangmanState3();}
        when(3) {&HangmanState4();}
        when(4) {&HangmanState5();}
        when(5) {&HangmanState6();}
        when(6) {&HangmanState7();
        $guessed = -1;
         print "Wanna try again?(y/n)\n";
                $playagain=<>;
                chomp($playagain);
                if($playagain eq 'y'){goto &main();}
                
               else {exit 0;}}
    }
}