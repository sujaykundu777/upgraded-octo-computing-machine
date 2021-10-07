import express, {Application, Request, Response, NextFunction} from 'express';

const app: Application = express();

app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.get('/', (req: Request, res: Response, next: NextFunction) => {
  res.send('server up and running !');
});

const PORT = process.env.PORT || 3001;

app.listen(PORT, () => {
  console.log(`server running on port ${PORT}`);
});
