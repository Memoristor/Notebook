
#include <iostream>
#include <string>

using namespace std;

class Solution {

public:

    // ��ȡ next ���飬ע���䳤�ȵ��� s.size() + 1
    void getNext(string s, int *next) {

        int i = 0, j = -1;

        // next �� 0 λ������ -1
        next[0] = -1;

        while (i < s.size()) {

            if (j == -1 || s[i] == s[j]) {
                next[++i] = ++j;
            } else {
                j = next[j];
            }
        }
    }

    // ���� next �������ƥ��
    bool isMatch(string target, string pattern) {

        // ����ģʽ�ַ��� next ����Ŀռ�
        int *next = new int[pattern.size() + 1]();

        // ��ȡģʽ�ַ����� next ����
        getNext(pattern, next);

        // ��� next ����
        for (int i = 0; i < pattern.size() + 1; ++i) {
            cout << next[i] << '\t';
        }
        cout << endl;

        // ���� next ����ƥ������
        int i = 0, j = 0;
        int len_t = target.size(), len_p = pattern.size();
        while (i < len_t && j < len_p) {
            if (j == -1 || target[i] == pattern[j]) {
                i++;
                j++;
            } else {
                j = next[j];
            }
        }

        bool res = (j == pattern.size());

        // ɾ�� next ����ռ�
        delete[] next;

        // ���ؽ��
        return res;
    }

};

int main() {

    Solution s;

    bool res = s.isMatch("abcadaabababc", "abababc");
    if (res) {
        cout << "matched" << endl;
    } else {
        cout << "not matched" << endl;
    }

    return 0;
}

