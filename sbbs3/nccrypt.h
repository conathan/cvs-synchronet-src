/* Uses crypt to generate a hashed password
 *
 * At this time, uses $6$ (SHA256)
 * As well as a 16 char password
 */
extern
#ifdef __cplusplus
"C"
#endif
const char* str2pwd(const char *rawpasswd);

/* Password checking, uses crypt to verify that the password
 * matches
 * rawpasswd is the plaintext password
 * hashpasswd is the hashed password
 */
extern
#ifdef __cplusplus
"C"
#endif
int pwdcmp(const char *rawpasswd, const char *hashpasswd);
