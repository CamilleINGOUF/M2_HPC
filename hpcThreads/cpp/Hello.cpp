#include <iostream>
#include <thread>

namespace Hello {

  // fonction qui affiche l'id du thread qui l'execute
  void noyauCalcul() {
    std::thread::id idThread = std::this_thread::get_id();
    std::cout << "Bonjour, je suis le thread " << idThread << std::endl;
  }

  void hello() {
    // affiche l'id du thread principal

    // exécute le noyau de calcul en parallèle sur 2 threads
    // TODO
    std::thread thread1(Hello::noyauCalcul);
    std::thread thread2(Hello::noyauCalcul);

    thread1.join();
    thread2.join();    
  }
}  // namespace Hello

