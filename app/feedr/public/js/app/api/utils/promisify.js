import  { Promise } from 'es6-promise';

export function promisify(request) {
    return new Promise((resolve, reject) => {

        request.end((err, response) => {
            if (err) { return reject(err); }
            resolve(response.body);
        });

    });
}
