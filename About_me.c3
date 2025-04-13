#include <stdio.h>
#include <stdlib.h>

// Define constant for candidate count
#define CANDIDATE_COUNT 6

// Member info fields
char *member_info[] = {
    "Name", "DOB", "Gender", "Email", "Nationality",
    "BMI", "Primary Skill", "Secondary Skill",
    "TOPIK", "MBTI", "Introduction"
};

// Arrays for each candidate's data
char candidate01[11][100];
char candidate02[11][100];
char candidate03[11][100];
char candidate04[11][100];
char candidate05[11][100];
char candidate06[11][100];

// Group name
char group_name[50];

// Function to get candidate pointer by index
char (*get_candidate(int index))[100] {
    switch (index) {
        case 0: return candidate01;
        case 1: return candidate02;
        case 2: return candidate03;
        case 3: return candidate04;
        case 4: return candidate05;
        case 5: return candidate06;
        default: return NULL;
    }
}

// Function to calculate age from birthdate
int calculate_age(const char *dob) {
    int year, month, day;
    sscanf(dob, "%d/%d/%d", &year, &month, &day);

    // Hard-coded current date (2025-04-13)
    int current_year = 2025, current_month = 4, current_day = 13;
    int age = current_year - year;

    if (month > current_month || (month == current_month && day > current_day)) {
        age--; // hasn't had birthday this year
    }
    return age;
}

int main() {
    int i, j;

    // Get group name
    printf("Enter audition group name: ");
    fgets(group_name, sizeof(group_name), stdin);
    // Remove newline if present
    for (i = 0; group_name[i] != '\0'; i++) {
        if (group_name[i] == '\n') {
            group_name[i] = '\0';
            break;
        }
    }

    printf("####################################\n");
    printf("[%s] Audition Candidate Data Entry\n", group_name);
    printf("####################################\n");

    // Data entry
    i = 0;
    while (i < CANDIDATE_COUNT) {
        printf("Entering information for candidate #%d.\n", i + 1);
        printf("---------------------------------\n");

        char (*candidate)[100] = get_candidate(i);

        for (j = 0; j < 11; j++) {
            printf("%d. %s: ", j + 1, member_info[j]);
            fgets(candidate[j], 100, stdin);

            // Remove newline character
            for (int k = 0; candidate[j][k] != '\0'; k++) {
                if (candidate[j][k] == '\n') {
                    candidate[j][k] = '\0';
                    break;
                }
            }
        }

        printf("=================================\n");
        i++;
    }

    // Display screen
    printf("\n####################################\n");
    printf("[%s] Audition Candidate Data Review\n", group_name);
    printf("####################################\n");

    printf("=============================================================================================\n");
    printf("Name                | Age | DOB       | Gender | Email                | Nationality | BMI  | Primary Skill | Secondary Skill | TOPIK   | MBTI |\n");
    printf("=============================================================================================\n");

    for (i = 0; i < CANDIDATE_COUNT; i++) {
        char (*candidate)[100] = get_candidate(i);
        int age = calculate_age(candidate[1]); // DOB is at index 1

        printf("%-18s (%2d) | %8s | %-6s | %-20s | %-12s | %-4s | %-13s | %-15s | ",
            candidate[0], age,
            candidate[1], candidate[2], candidate[3], candidate[4],
            candidate[5], candidate[6], candidate[7]);

        // Display Korean proficiency as "Native" if 0
        if (candidate[8][0] == '0')
            printf("Native  | ");
        else
            printf("%-7s | ", candidate[8]);

        printf("%-4s |\n", candidate[9]);

        printf("---------------------------------------------------------------------------------------------\n");
        printf("%s\n", candidate[10]);  // Introduction
        printf("---------------------------------------------------------------------------------------------\n");
    }

    return 0;
}
