require 'tty-prompt'

def afficher_options(prompt)
  options = [
    "Generer une phrase aleatoire",
    "Ajouter une nouvelle phrase",
    "Quitter"
  ]

  prompt.select("Options :", options, active_color: :bright_magenta, symbols: { marker: "+>" })
end

def generer_phrase_aleatoire(phrases)
  phrase_aleatoire = phrases.sample
  phrase_aleatoire
end

def ajouter_nouvelle_phrase(phrases, nouvelle_phrase)
  phrases << nouvelle_phrase
  File.open('ph.txt', 'a') { |file| file.puts nouvelle_phrase }
end

def main
    phrases = File.readlines('ph.txt', chomp: true)
    phrases.reject! { |phrase| phrase.strip.empty? }
  
    @prompt = TTY::Prompt.new
  
    loop do
      choix = afficher_options(@prompt)
  
      case choix
      when "Generer une phrase aleatoire"
        generated_phrase = generer_phrase_aleatoire(phrases)
        puts ":p : #{generated_phrase}"
      when "Ajouter une nouvelle phrase"
        nouvelle_phrase = @prompt.ask(":o : ")
        ajouter_nouvelle_phrase(phrases, nouvelle_phrase)
        puts "\nPhrase ajoutee avec succes.\n"
      when "Quitter"
        puts "Nique ta race ! ^^"
        STDOUT.flush
        sleep 2
        break
      end
  
      sleep 6
      system('clear') || system('cls')
    end
  end
  

main
