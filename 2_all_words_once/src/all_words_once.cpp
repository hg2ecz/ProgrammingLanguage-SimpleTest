#include <iostream>
#include <vector>
#include <fstream>
#include <set>
#include <iterator>
#include <sstream>

using namespace std;

string remove_dup_words(stringstream* wordstream) {
    unordered_set<string> words;
    vector<string> v;
    ostringstream oss;
    string word;
    while(*wordstream >> word) {
        if (words.insert(word).second) {
            v.push_back(word);
        }
    }
    copy(v.begin(), v.end(), ostream_iterator<string>(oss, " ")); 
    return oss.str();
}

int main(int argc, char *argv[]) {
    char *inputFileName = argv[1];
    int repeat = stoi(argv[2]);
    string reply;
    ifstream inputFile;
    inputFile.open(inputFileName);
    stringstream raw_buffer;
    raw_buffer << inputFile.rdbuf();
    for (int i=0; i < repeat; i++) {
        stringstream buffer(raw_buffer.str());
        reply = remove_dup_words(&buffer);
    }
    inputFile.close();
    cout << reply;
    cerr << "C++" << endl;
    return 0;
}
